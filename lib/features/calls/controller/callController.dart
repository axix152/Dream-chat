import 'package:dreamchat/features/calls/repositiory/call_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final callControllerProvider = Provider((ref) {
  final callReposityory = ref.watch(callReposityoryProvider);
  return CallController(
    callReposityory: callReposityory,
    ref: ref,
  );
});

class CallController {
  final CallReposityory callReposityory;
  final ProviderRef ref;

  CallController({
    required this.callReposityory,
    required this.ref,
  });

  Future<String> createCall(String callerId, String reciverId) {
    return callReposityory.createCall(
      callerId,
      reciverId,
    );
  }

  Future<String> getCallId(String callerId, String reciverId) {
    return callReposityory.getCallId(
      callerId,
      reciverId,
    );
  }
}
