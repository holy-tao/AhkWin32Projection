#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Provides job-related time stamps.
 * @see https://learn.microsoft.com/windows/win32/api/bits/ns-bits-bg_job_times
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class BG_JOB_TIMES extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Time the job was created. The time is specified as 
     * <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     * @type {FILETIME}
     */
    CreationTime{
        get {
            if(!this.HasProp("__CreationTime"))
                this.__CreationTime := FILETIME(this.ptr + 0)
            return this.__CreationTime
        }
    }

    /**
     * Time the job was last modified or bytes were transferred. Adding files or calling any of the set methods in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits3_0/nn-bits3_0-ibackgroundcopyjob4">IBackgroundCopyJob*</a> interfaces changes this value. In addition, changes to the state of the job and calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-suspend">Suspend</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-resume">Resume</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-cancel">Cancel</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-complete">Complete</a> methods change this value. The time is specified as 
     * <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     * @type {FILETIME}
     */
    ModificationTime{
        get {
            if(!this.HasProp("__ModificationTime"))
                this.__ModificationTime := FILETIME(this.ptr + 8)
            return this.__ModificationTime
        }
    }

    /**
     * Time the job entered the BG_JOB_STATE_TRANSFERRED state. The time is specified as 
     * <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     * @type {FILETIME}
     */
    TransferCompletionTime{
        get {
            if(!this.HasProp("__TransferCompletionTime"))
                this.__TransferCompletionTime := FILETIME(this.ptr + 16)
            return this.__TransferCompletionTime
        }
    }
}
