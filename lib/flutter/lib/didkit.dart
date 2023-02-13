library didkit;

import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';

// TODO: support Windows
final DynamicLibrary lib = Platform.isAndroid || Platform.isLinux
    ? DynamicLibrary.open('libdidkit.so')
    : Platform.isMacOS
        ? DynamicLibrary.open('libdidkit.dylib')
        : DynamicLibrary.process();

final get_version =
    lib.lookupFunction<Pointer<Utf8> Function(), Pointer<Utf8> Function()>(
        'didkit_get_version');

final get_error_message =
    lib.lookupFunction<Pointer<Utf8> Function(), Pointer<Utf8> Function()>(
        'didkit_error_message');

final get_error_code =
    lib.lookupFunction<Int32 Function(), int Function()>('didkit_error_code');

final generate_ed25519_key =
    lib.lookupFunction<Pointer<Utf8> Function(), Pointer<Utf8> Function()>(
        'didkit_generate_ed25519_key');

final generate_secp256r1_key =
    lib.lookupFunction<Pointer<Utf8> Function(), Pointer<Utf8> Function()>(
        'didkit_generate_secp256r1_key');

final generate_secp256k1_key =
    lib.lookupFunction<Pointer<Utf8> Function(), Pointer<Utf8> Function()>(
        'didkit_generate_secp256k1_key');

final generate_secp384r1_key =
    lib.lookupFunction<Pointer<Utf8> Function(), Pointer<Utf8> Function()>(
        'didkit_generate_secp384r1_key');

final key_to_did = lib.lookupFunction<
    Pointer<Utf8> Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
),
    Pointer<Utf8> Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
)>('didkit_key_to_did');

final key_to_verification_method = lib.lookupFunction<
    Pointer<Utf8> Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
),
    Pointer<Utf8> Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
)>('didkit_key_to_verification_method');

final issue_credential = lib.lookupFunction<
    Pointer<Utf8> Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
),
    Pointer<Utf8> Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
)>('didkit_vc_issue_credential');

final verify_credential = lib.lookupFunction<
    Pointer<Utf8> Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
),
    Pointer<Utf8> Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
)>('didkit_vc_verify_credential');

final issue_presentation = lib.lookupFunction<
    Pointer<Utf8> Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
),
    Pointer<Utf8> Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
)>('didkit_vc_issue_presentation');

final verify_presentation = lib.lookupFunction<
    Pointer<Utf8> Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
),
    Pointer<Utf8> Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
)>('didkit_vc_verify_presentation');

final resolve_did = lib.lookupFunction<
    Pointer<Utf8> Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
),
    Pointer<Utf8> Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
)>('didkit_resolve_did');

final dereference_did_url = lib.lookupFunction<
    Pointer<Utf8> Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
),
    Pointer<Utf8> Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
)>('didkit_dereference_did_url');

final did_auth = lib.lookupFunction<
    Pointer<Utf8> Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
),
    Pointer<Utf8> Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
)>('didkit_did_auth');

final create_context = lib.lookupFunction<
    Pointer<Utf8> Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
),
    Pointer<Utf8> Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
)>('didkit_create_context');

final create_context_map = lib.lookupFunction<
    Pointer<Utf8> Function(
  Pointer<Pointer<Utf8>>,
  Uint32,
),
    Pointer<Utf8> Function(
  Pointer<Pointer<Utf8>>,
  int,
)>('didkit_create_context_map');

final prepare_issue_credential = lib.lookupFunction<
    Pointer<Utf8> Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
),
    Pointer<Utf8> Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
)>('didkit_vc_prepare_issue_credential');

final complete_issue_credential = lib.lookupFunction<
    Pointer<Utf8> Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
),
    Pointer<Utf8> Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
)>('didkit_vc_complete_issue_credential');

final prepare_issue_presentation = lib.lookupFunction<
    Pointer<Utf8> Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
),
    Pointer<Utf8> Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
)>('didkit_vc_prepare_issue_presentation');

final complete_issue_presentation = lib.lookupFunction<
    Pointer<Utf8> Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
),
    Pointer<Utf8> Function(
  Pointer<Utf8>,
  Pointer<Utf8>,
  Pointer<Utf8>,
)>('didkit_vc_complete_issue_presentation');

final free_string = lib.lookupFunction<
    Void Function(
  Pointer<Utf8>,
),
    void Function(
  Pointer<Utf8>,
)>('didkit_free_string');

class DIDKitException implements Exception {
  int code;
  String message;

  DIDKitException(this.code, this.message);

  @override
  String toString() {
    return 'DIDKitException ($code): $message';
  }
}

DIDKitException lastError() {
  final code = get_error_code();
  final message_utf8 = get_error_message();
  final message_string = message_utf8.address == nullptr.address
      ? 'Unable to get error message'
      : message_utf8.toDartString();

  return DIDKitException(code, message_string);
}

class DIDKit {
  static String getVersion() {
    return get_version().toDartString();
  }

  static String generateEd25519Key() {
    final key = generate_ed25519_key();
    if (key.address == nullptr.address) throw lastError();
    final key_string = key.toDartString();
    free_string(key);
    return key_string;
  }

  static String generateSecp256r1Key() {
    final key = generate_secp256r1_key();
    if (key.address == nullptr.address) throw lastError();
    final key_string = key.toDartString();
    free_string(key);
    return key_string;
  }

  static String generateSecp256k1Key() {
    final key = generate_secp256k1_key();
    if (key.address == nullptr.address) throw lastError();
    final key_string = key.toDartString();
    free_string(key);
    return key_string;
  }

  static String generateSecp384r1Key() {
    final key = generate_secp384r1_key();
    if (key.address == nullptr.address) throw lastError();
    final key_string = key.toDartString();
    free_string(key);
    return key_string;
  }

  @Deprecated('Use [keyToDID]')
  static String keyToDIDKey(String key) {
    final did_key = key_to_did('key'.toNativeUtf8(), key.toNativeUtf8());
    if (did_key.address == nullptr.address) throw lastError();
    final did_key_string = did_key.toDartString();
    free_string(did_key);
    return did_key_string;
  }

  static String keyToDID(String methodPattern, String key) {
    final did = key_to_did(methodPattern.toNativeUtf8(), key.toNativeUtf8());
    if (did.address == nullptr.address) throw lastError();
    final did_string = did.toDartString();
    free_string(did);
    return did_string;
  }

  static String keyToVerificationMethod(String methodPattern, String key) {
    final vm = key_to_verification_method(
        methodPattern.toNativeUtf8(), key.toNativeUtf8());
    if (vm.address == nullptr.address) throw lastError();
    final vm_string = vm.toDartString();
    free_string(vm);
    return vm_string;
  }

  static String issueCredential(
    String credential,
    String options,
    String key, [
    String? contextMap,
  ]) {
    final vc = issue_credential(
      credential.toNativeUtf8(),
      options.toNativeUtf8(),
      key.toNativeUtf8(),
      contextMap?.toNativeUtf8() ?? nullptr,
    );
    if (vc.address == nullptr.address) throw lastError();
    final vc_string = vc.toDartString();
    free_string(vc);
    return vc_string;
  }

  static String verifyCredential(
    String credential,
    String options, [
    String? contextMap,
  ]) {
    final result = verify_credential(
      credential.toNativeUtf8(),
      options.toNativeUtf8(),
      contextMap?.toNativeUtf8() ?? nullptr,
    );
    if (result.address == nullptr.address) throw lastError();
    final result_string = result.toDartString();
    free_string(result);
    return result_string;
  }

  static String issuePresentation(
    String presentation,
    String options,
    String key, [
    String? contextMap,
  ]) {
    final vp = issue_presentation(
      presentation.toNativeUtf8(),
      options.toNativeUtf8(),
      key.toNativeUtf8(),
      contextMap?.toNativeUtf8() ?? nullptr,
    );
    if (vp.address == nullptr.address) throw lastError();
    final vp_string = vp.toDartString();
    free_string(vp);
    return vp_string;
  }

  static String verifyPresentation(
    String presentation,
    String options, [
    String? contextMap,
  ]) {
    final result = verify_presentation(
      presentation.toNativeUtf8(),
      options.toNativeUtf8(),
      contextMap?.toNativeUtf8() ?? nullptr,
    );
    if (result.address == nullptr.address) throw lastError();
    final result_string = result.toDartString();
    free_string(result);
    return result_string;
  }

  static String resolveDID(String did, String inputMetadata) {
    final result =
        resolve_did(did.toNativeUtf8(), inputMetadata.toNativeUtf8());
    if (result.address == nullptr.address) throw lastError();
    final result_string = result.toDartString();
    free_string(result);
    return result_string;
  }

  static String dereferenceDIDURL(String didUrl, String inputMetadata) {
    final result = dereference_did_url(
        didUrl.toNativeUtf8(), inputMetadata.toNativeUtf8());
    if (result.address == nullptr.address) throw lastError();
    final result_string = result.toDartString();
    free_string(result);
    return result_string;
  }

  static String DIDAuth(
    String did,
    String options,
    String key, [
    String? contextMap,
  ]) {
    final vp = did_auth(
      did.toNativeUtf8(),
      options.toNativeUtf8(),
      key.toNativeUtf8(),
      contextMap?.toNativeUtf8() ?? nullptr,
    );
    if (vp.address == nullptr.address) throw lastError();
    final vp_string = vp.toDartString();
    free_string(vp);
    return vp_string;
  }

  static String createContext(
    String url,
    String json,
  ) {
    final context = create_context(
      url.toNativeUtf8(),
      json.toNativeUtf8(),
    );
    if (context.address == nullptr.address) throw lastError();
    final context_string = context.toDartString();
    free_string(context);
    return context_string;
  }

  static String createContextMap(List<String> contexts) {
    final size = contexts.length;
    final array = malloc.allocate<Pointer<Utf8>>(size);

    final native = contexts.map((c) => c.toNativeUtf8()).toList();

    native.asMap().forEach((index, str) {
      array[index] = str;
    });

    final context = create_context_map(array, size);
    malloc.free(array);

    if (context.address == nullptr.address) throw lastError();
    final context_string = context.toDartString();
    free_string(context);
    return context_string;
  }

  static String prepareIssueCredential(
    String credential,
    String options,
    String key, [
    String? contextMap,
  ]) {
    final prep = prepare_issue_credential(
      credential.toNativeUtf8(),
      options.toNativeUtf8(),
      key.toNativeUtf8(),
      contextMap?.toNativeUtf8() ?? nullptr,
    );
    if (prep.address == nullptr.address) throw lastError();
    final prep_string = prep.toDartString();
    free_string(prep);
    return prep_string;
  }

  static String completeIssueCredential(
    String credential,
    String preparation,
    String signature,
  ) {
    final vc = complete_issue_credential(
      credential.toNativeUtf8(),
      preparation.toNativeUtf8(),
      signature.toNativeUtf8(),
    );
    if (vc.address == nullptr.address) throw lastError();
    final vc_string = vc.toDartString();
    free_string(vc);
    return vc_string;
  }

  static String prepareIssuePresentation(
    String presentation,
    String options,
    String key, [
    String? contextMap,
  ]) {
    final prep = prepare_issue_presentation(
      presentation.toNativeUtf8(),
      options.toNativeUtf8(),
      key.toNativeUtf8(),
      contextMap?.toNativeUtf8() ?? nullptr,
    );
    if (prep.address == nullptr.address) throw lastError();
    final prep_string = prep.toDartString();
    free_string(prep);
    return prep_string;
  }

  static String completeIssuePresentation(
    String presentation,
    String preparation,
    String signature,
  ) {
    final vp = complete_issue_presentation(
      presentation.toNativeUtf8(),
      preparation.toNativeUtf8(),
      signature.toNativeUtf8(),
    );
    if (vp.address == nullptr.address) throw lastError();
    final vp_string = vp.toDartString();
    free_string(vp);
    return vp_string;
  }
}
