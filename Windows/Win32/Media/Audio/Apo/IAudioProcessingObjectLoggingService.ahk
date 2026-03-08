#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Represents a logging service for APOs.
 * @remarks
 * Get an instance of this interface by [QueryService](/previous-versions/windows/internet-explorer/ie-developer/platform-apis/cc678966(v=vs.85)) on the object in the *pServiceProvider* field of the [APOInitSystemEffects3](nn-audioengineextensionapo-iaudiosystemeffects3.md) structure passed in the *pbyData* parameter to [IAudioProcessingObject::Initialize](/windows/win32/api/audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobject-initialize). Specify **SID_AudioProcessingObjectLoggingService** as the identifier in the *guidService* parameter. 
 * 
 * > [!NOTE]
 * > [IAudioProcessingObjectLoggingService::ApoLog](nf-audioengineextensionapo-iaudioprocessingobjectloggingservice-apolog.md) should never be called from a real-time priority thread. For more information on thread priorities, see [Scheduling Priorities](/windows/win32/procthread/scheduling-priorities).
 * 
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/nn-audioengineextensionapo-iaudioprocessingobjectloggingservice
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class IAudioProcessingObjectLoggingService extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioProcessingObjectLoggingService
     * @type {Guid}
     */
    static IID => Guid("{698f0107-1745-4708-95a5-d84478a62a65}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ApoLog"]

    /**
     * Logs an APO event.
     * @remarks
     * > [!NOTE] 
     * > This method should never be called from a real-time priority thread. For more information on thread priorities, see [Scheduling Priorities](/windows/win32/procthread/scheduling-priorities).
     * 
     * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
     * @param {Integer} level A value from the [APO_LOG_LEVEL](ne-audioengineextensionapo-apo_log_level.md) enumeration specifying the level of the event being logged.
     * @param {PWSTR} format The format-control string for the log message.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/nf-audioengineextensionapo-iaudioprocessingobjectloggingservice-apolog
     */
    ApoLog(level, format) {
        format := format is String ? StrPtr(format) : format

        ComCall(3, this, "int", level, "ptr", format)
    }
}
