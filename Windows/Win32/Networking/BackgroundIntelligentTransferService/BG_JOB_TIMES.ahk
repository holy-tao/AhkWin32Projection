#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Provides job-related time stamps.
 * @see https://learn.microsoft.com/windows/win32/api/bits/ns-bits-bg_job_times
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct BG_JOB_TIMES {
    #StructPack 4

    /**
     * Time the job was created. The time is specified as 
     * <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     */
    CreationTime : FILETIME

    /**
     * Time the job was last modified or bytes were transferred. Adding files or calling any of the set methods in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits3_0/nn-bits3_0-ibackgroundcopyjob4">IBackgroundCopyJob*</a> interfaces changes this value. In addition, changes to the state of the job and calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-suspend">Suspend</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-resume">Resume</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-cancel">Cancel</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-complete">Complete</a> methods change this value. The time is specified as 
     * <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     */
    ModificationTime : FILETIME

    /**
     * Time the job entered the BG_JOB_STATE_TRANSFERRED state. The time is specified as 
     * <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     */
    TransferCompletionTime : FILETIME

}
