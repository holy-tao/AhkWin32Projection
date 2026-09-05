#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines protection levels for MFPROTECTION_CGMSA.
 * @remarks
 * These flags are equivalent to the OPM_CGMSA_Protection_Level enumeration constants used in the Output Protection Protocol (OPM).
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mf_opm_cgmsa_protection_level
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_OPM_CGMSA_PROTECTION_LEVEL extends Win32Enum {

    /**
     * CGMS-A is disabled.
     * Native name: MF_OPM_CGMSA_OFF
     * @type {Integer (Int32)}
     */
    static OFF => 0

    /**
     * The protection level is Copy Freely.
     * Native name: MF_OPM_CGMSA_COPY_FREELY
     * @type {Integer (Int32)}
     */
    static COPY_FREELY => 1

    /**
     * The protection level is Copy No More.
     * Native name: MF_OPM_CGMSA_COPY_NO_MORE
     * @type {Integer (Int32)}
     */
    static COPY_NO_MORE => 2

    /**
     * The protection level is Copy One Generation.
     * Native name: MF_OPM_CGMSA_COPY_ONE_GENERATION
     * @type {Integer (Int32)}
     */
    static COPY_ONE_GENERATION => 3

    /**
     * The protection level is Copy Never.
     * Native name: MF_OPM_CGMSA_COPY_NEVER
     * @type {Integer (Int32)}
     */
    static COPY_NEVER => 4

    /**
     * Redistribution control (also called the broadcast flag) is required. This flag can be combined with the other flags.
     * Native name: MF_OPM_CGMSA_REDISTRIBUTION_CONTROL_REQUIRED
     * @type {Integer (Int32)}
     */
    static REDISTRIBUTION_CONTROL_REQUIRED => 8
}
