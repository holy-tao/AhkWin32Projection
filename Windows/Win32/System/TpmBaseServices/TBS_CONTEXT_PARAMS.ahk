#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the version of the TBS context implementation.
 * @see https://learn.microsoft.com/windows/win32/api/tbs/ns-tbs-tbs_context_params
 * @namespace Windows.Win32.System.TpmBaseServices
 */
export default struct TBS_CONTEXT_PARAMS {
    #StructPack 4

    /**
     * The version of the TBS context implementation. This parameter must be TBS_CONTEXT_VERSION_ONE.
     */
    version : UInt32

}
