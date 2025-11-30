#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class __MIDL___MIDL_itf_mfobjects_0000_0013_0001 extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MEUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static MEError => 1

    /**
     * @type {Integer (Int32)}
     */
    static MEExtendedType => 2

    /**
     * @type {Integer (Int32)}
     */
    static MENonFatalError => 3

    /**
     * @type {Integer (Int32)}
     */
    static MEGenericV1Anchor => 3

    /**
     * @type {Integer (Int32)}
     */
    static MESessionUnknown => 100

    /**
     * @type {Integer (Int32)}
     */
    static MESessionTopologySet => 101

    /**
     * @type {Integer (Int32)}
     */
    static MESessionTopologiesCleared => 102

    /**
     * @type {Integer (Int32)}
     */
    static MESessionStarted => 103

    /**
     * @type {Integer (Int32)}
     */
    static MESessionPaused => 104

    /**
     * @type {Integer (Int32)}
     */
    static MESessionStopped => 105

    /**
     * @type {Integer (Int32)}
     */
    static MESessionClosed => 106

    /**
     * @type {Integer (Int32)}
     */
    static MESessionEnded => 107

    /**
     * @type {Integer (Int32)}
     */
    static MESessionRateChanged => 108

    /**
     * @type {Integer (Int32)}
     */
    static MESessionScrubSampleComplete => 109

    /**
     * @type {Integer (Int32)}
     */
    static MESessionCapabilitiesChanged => 110

    /**
     * @type {Integer (Int32)}
     */
    static MESessionTopologyStatus => 111

    /**
     * @type {Integer (Int32)}
     */
    static MESessionNotifyPresentationTime => 112

    /**
     * @type {Integer (Int32)}
     */
    static MENewPresentation => 113

    /**
     * @type {Integer (Int32)}
     */
    static MELicenseAcquisitionStart => 114

    /**
     * @type {Integer (Int32)}
     */
    static MELicenseAcquisitionCompleted => 115

    /**
     * @type {Integer (Int32)}
     */
    static MEIndividualizationStart => 116

    /**
     * @type {Integer (Int32)}
     */
    static MEIndividualizationCompleted => 117

    /**
     * @type {Integer (Int32)}
     */
    static MEEnablerProgress => 118

    /**
     * @type {Integer (Int32)}
     */
    static MEEnablerCompleted => 119

    /**
     * @type {Integer (Int32)}
     */
    static MEPolicyError => 120

    /**
     * @type {Integer (Int32)}
     */
    static MEPolicyReport => 121

    /**
     * @type {Integer (Int32)}
     */
    static MEBufferingStarted => 122

    /**
     * @type {Integer (Int32)}
     */
    static MEBufferingStopped => 123

    /**
     * @type {Integer (Int32)}
     */
    static MEConnectStart => 124

    /**
     * @type {Integer (Int32)}
     */
    static MEConnectEnd => 125

    /**
     * @type {Integer (Int32)}
     */
    static MEReconnectStart => 126

    /**
     * @type {Integer (Int32)}
     */
    static MEReconnectEnd => 127

    /**
     * @type {Integer (Int32)}
     */
    static MERendererEvent => 128

    /**
     * @type {Integer (Int32)}
     */
    static MESessionStreamSinkFormatChanged => 129

    /**
     * @type {Integer (Int32)}
     */
    static MESessionV1Anchor => 129

    /**
     * @type {Integer (Int32)}
     */
    static MESourceUnknown => 200

    /**
     * @type {Integer (Int32)}
     */
    static MESourceStarted => 201

    /**
     * @type {Integer (Int32)}
     */
    static MEStreamStarted => 202

    /**
     * @type {Integer (Int32)}
     */
    static MESourceSeeked => 203

    /**
     * @type {Integer (Int32)}
     */
    static MEStreamSeeked => 204

    /**
     * @type {Integer (Int32)}
     */
    static MENewStream => 205

    /**
     * @type {Integer (Int32)}
     */
    static MEUpdatedStream => 206

    /**
     * @type {Integer (Int32)}
     */
    static MESourceStopped => 207

    /**
     * @type {Integer (Int32)}
     */
    static MEStreamStopped => 208

    /**
     * @type {Integer (Int32)}
     */
    static MESourcePaused => 209

    /**
     * @type {Integer (Int32)}
     */
    static MEStreamPaused => 210

    /**
     * @type {Integer (Int32)}
     */
    static MEEndOfPresentation => 211

    /**
     * @type {Integer (Int32)}
     */
    static MEEndOfStream => 212

    /**
     * @type {Integer (Int32)}
     */
    static MEMediaSample => 213

    /**
     * @type {Integer (Int32)}
     */
    static MEStreamTick => 214

    /**
     * @type {Integer (Int32)}
     */
    static MEStreamThinMode => 215

    /**
     * @type {Integer (Int32)}
     */
    static MEStreamFormatChanged => 216

    /**
     * @type {Integer (Int32)}
     */
    static MESourceRateChanged => 217

    /**
     * @type {Integer (Int32)}
     */
    static MEEndOfPresentationSegment => 218

    /**
     * @type {Integer (Int32)}
     */
    static MESourceCharacteristicsChanged => 219

    /**
     * @type {Integer (Int32)}
     */
    static MESourceRateChangeRequested => 220

    /**
     * @type {Integer (Int32)}
     */
    static MESourceMetadataChanged => 221

    /**
     * @type {Integer (Int32)}
     */
    static MESequencerSourceTopologyUpdated => 222

    /**
     * @type {Integer (Int32)}
     */
    static MESourceV1Anchor => 222

    /**
     * @type {Integer (Int32)}
     */
    static MESinkUnknown => 300

    /**
     * @type {Integer (Int32)}
     */
    static MEStreamSinkStarted => 301

    /**
     * @type {Integer (Int32)}
     */
    static MEStreamSinkStopped => 302

    /**
     * @type {Integer (Int32)}
     */
    static MEStreamSinkPaused => 303

    /**
     * @type {Integer (Int32)}
     */
    static MEStreamSinkRateChanged => 304

    /**
     * @type {Integer (Int32)}
     */
    static MEStreamSinkRequestSample => 305

    /**
     * @type {Integer (Int32)}
     */
    static MEStreamSinkMarker => 306

    /**
     * @type {Integer (Int32)}
     */
    static MEStreamSinkPrerolled => 307

    /**
     * @type {Integer (Int32)}
     */
    static MEStreamSinkScrubSampleComplete => 308

    /**
     * @type {Integer (Int32)}
     */
    static MEStreamSinkFormatChanged => 309

    /**
     * @type {Integer (Int32)}
     */
    static MEStreamSinkDeviceChanged => 310

    /**
     * @type {Integer (Int32)}
     */
    static MEQualityNotify => 311

    /**
     * @type {Integer (Int32)}
     */
    static MESinkInvalidated => 312

    /**
     * @type {Integer (Int32)}
     */
    static MEAudioSessionNameChanged => 313

    /**
     * @type {Integer (Int32)}
     */
    static MEAudioSessionVolumeChanged => 314

    /**
     * @type {Integer (Int32)}
     */
    static MEAudioSessionDeviceRemoved => 315

    /**
     * @type {Integer (Int32)}
     */
    static MEAudioSessionServerShutdown => 316

    /**
     * @type {Integer (Int32)}
     */
    static MEAudioSessionGroupingParamChanged => 317

    /**
     * @type {Integer (Int32)}
     */
    static MEAudioSessionIconChanged => 318

    /**
     * @type {Integer (Int32)}
     */
    static MEAudioSessionFormatChanged => 319

    /**
     * @type {Integer (Int32)}
     */
    static MEAudioSessionDisconnected => 320

    /**
     * @type {Integer (Int32)}
     */
    static MEAudioSessionExclusiveModeOverride => 321

    /**
     * @type {Integer (Int32)}
     */
    static MESinkV1Anchor => 321

    /**
     * @type {Integer (Int32)}
     */
    static MECaptureAudioSessionVolumeChanged => 322

    /**
     * @type {Integer (Int32)}
     */
    static MECaptureAudioSessionDeviceRemoved => 323

    /**
     * @type {Integer (Int32)}
     */
    static MECaptureAudioSessionFormatChanged => 324

    /**
     * @type {Integer (Int32)}
     */
    static MECaptureAudioSessionDisconnected => 325

    /**
     * @type {Integer (Int32)}
     */
    static MECaptureAudioSessionExclusiveModeOverride => 326

    /**
     * @type {Integer (Int32)}
     */
    static MECaptureAudioSessionServerShutdown => 327

    /**
     * @type {Integer (Int32)}
     */
    static MESinkV2Anchor => 327

    /**
     * @type {Integer (Int32)}
     */
    static METrustUnknown => 400

    /**
     * @type {Integer (Int32)}
     */
    static MEPolicyChanged => 401

    /**
     * @type {Integer (Int32)}
     */
    static MEContentProtectionMessage => 402

    /**
     * @type {Integer (Int32)}
     */
    static MEPolicySet => 403

    /**
     * @type {Integer (Int32)}
     */
    static METrustV1Anchor => 403

    /**
     * @type {Integer (Int32)}
     */
    static MEWMDRMLicenseBackupCompleted => 500

    /**
     * @type {Integer (Int32)}
     */
    static MEWMDRMLicenseBackupProgress => 501

    /**
     * @type {Integer (Int32)}
     */
    static MEWMDRMLicenseRestoreCompleted => 502

    /**
     * @type {Integer (Int32)}
     */
    static MEWMDRMLicenseRestoreProgress => 503

    /**
     * @type {Integer (Int32)}
     */
    static MEWMDRMLicenseAcquisitionCompleted => 506

    /**
     * @type {Integer (Int32)}
     */
    static MEWMDRMIndividualizationCompleted => 508

    /**
     * @type {Integer (Int32)}
     */
    static MEWMDRMIndividualizationProgress => 513

    /**
     * @type {Integer (Int32)}
     */
    static MEWMDRMProximityCompleted => 514

    /**
     * @type {Integer (Int32)}
     */
    static MEWMDRMLicenseStoreCleaned => 515

    /**
     * @type {Integer (Int32)}
     */
    static MEWMDRMRevocationDownloadCompleted => 516

    /**
     * @type {Integer (Int32)}
     */
    static MEWMDRMV1Anchor => 516

    /**
     * @type {Integer (Int32)}
     */
    static METransformUnknown => 600

    /**
     * @type {Integer (Int32)}
     */
    static METransformNeedInput => 601

    /**
     * @type {Integer (Int32)}
     */
    static METransformHaveOutput => 602

    /**
     * @type {Integer (Int32)}
     */
    static METransformDrainComplete => 603

    /**
     * @type {Integer (Int32)}
     */
    static METransformMarker => 604

    /**
     * @type {Integer (Int32)}
     */
    static METransformInputStreamStateChanged => 605

    /**
     * @type {Integer (Int32)}
     */
    static MEByteStreamCharacteristicsChanged => 700

    /**
     * @type {Integer (Int32)}
     */
    static MEVideoCaptureDeviceRemoved => 800

    /**
     * @type {Integer (Int32)}
     */
    static MEVideoCaptureDevicePreempted => 801

    /**
     * @type {Integer (Int32)}
     */
    static MEStreamSinkFormatInvalidated => 802

    /**
     * @type {Integer (Int32)}
     */
    static MEEncodingParameters => 803

    /**
     * @type {Integer (Int32)}
     */
    static MEContentProtectionMetadata => 900

    /**
     * @type {Integer (Int32)}
     */
    static MEDeviceThermalStateChanged => 950

    /**
     * @type {Integer (Int32)}
     */
    static MEReservedMax => 10000
}
