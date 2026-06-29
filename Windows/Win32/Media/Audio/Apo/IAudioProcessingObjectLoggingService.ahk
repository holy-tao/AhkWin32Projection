#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\APO_LOG_LEVEL.ahk" { APO_LOG_LEVEL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

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
 */
export default struct IAudioProcessingObjectLoggingService extends IUnknown {
    /**
     * The interface identifier for IAudioProcessingObjectLoggingService
     * @type {Guid}
     */
    static IID := Guid("{698f0107-1745-4708-95a5-d84478a62a65}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioProcessingObjectLoggingService interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ApoLog : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioProcessingObjectLoggingService.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Logs an APO event.
     * @remarks
     * > [!NOTE] 
     * > This method should never be called from a real-time priority thread. For more information on thread priorities, see [Scheduling Priorities](/windows/win32/procthread/scheduling-priorities).
     * 
     * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
     * @param {APO_LOG_LEVEL} level A value from the [APO_LOG_LEVEL](ne-audioengineextensionapo-apo_log_level.md) enumeration specifying the level of the event being logged.
     * @param {PWSTR} format The format-control string for the log message.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/nf-audioengineextensionapo-iaudioprocessingobjectloggingservice-apolog
     */
    ApoLog(level, format) {
        format := format is String ? StrPtr(format) : format

        ComCall(3, this, APO_LOG_LEVEL, level, "ptr", format)
    }

    Query(iid) {
        if (IAudioProcessingObjectLoggingService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ApoLog := CallbackCreate(GetMethod(implObj, "ApoLog"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ApoLog)
    }
}
