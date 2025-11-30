#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dquerytype
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DQUERYTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DQUERYTYPE_VCACHE => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DQUERYTYPE_RESOURCEMANAGER => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DQUERYTYPE_VERTEXSTATS => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DQUERYTYPE_EVENT => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DQUERYTYPE_OCCLUSION => 9

    /**
     * @type {Integer (Int32)}
     */
    static D3DQUERYTYPE_TIMESTAMP => 10

    /**
     * @type {Integer (Int32)}
     */
    static D3DQUERYTYPE_TIMESTAMPDISJOINT => 11

    /**
     * @type {Integer (Int32)}
     */
    static D3DQUERYTYPE_TIMESTAMPFREQ => 12

    /**
     * @type {Integer (Int32)}
     */
    static D3DQUERYTYPE_PIPELINETIMINGS => 13

    /**
     * @type {Integer (Int32)}
     */
    static D3DQUERYTYPE_INTERFACETIMINGS => 14

    /**
     * @type {Integer (Int32)}
     */
    static D3DQUERYTYPE_VERTEXTIMINGS => 15

    /**
     * @type {Integer (Int32)}
     */
    static D3DQUERYTYPE_PIXELTIMINGS => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DQUERYTYPE_BANDWIDTHTIMINGS => 17

    /**
     * @type {Integer (Int32)}
     */
    static D3DQUERYTYPE_CACHEUTILIZATION => 18

    /**
     * @type {Integer (Int32)}
     */
    static D3DQUERYTYPE_MEMORYPRESSURE => 19
}
