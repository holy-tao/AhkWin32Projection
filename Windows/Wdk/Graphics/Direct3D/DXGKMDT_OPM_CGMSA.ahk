#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGKMDT_OPM_CGMSA extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_CGMSA_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_CGMSA_COPY_FREELY => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_CGMSA_COPY_NO_MORE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_CGMSA_COPY_ONE_GENERATION => 3

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_CGMSA_COPY_NEVER => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_REDISTRIBUTION_CONTROL_REQUIRED => 8
}
