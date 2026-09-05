#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the query type.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dquerytype
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
class D3DQUERYTYPE extends Win32Enum {

    /**
     * Native name: D3DQUERYTYPE_VCACHE
     * @type {Integer (Int32)}
     */
    static VCACHE => 4

    /**
     * Native name: D3DQUERYTYPE_RESOURCEMANAGER
     * @type {Integer (Int32)}
     */
    static RESOURCEMANAGER => 5

    /**
     * Native name: D3DQUERYTYPE_VERTEXSTATS
     * @type {Integer (Int32)}
     */
    static VERTEXSTATS => 6

    /**
     * Native name: D3DQUERYTYPE_EVENT
     * @type {Integer (Int32)}
     */
    static EVENT => 8

    /**
     * Native name: D3DQUERYTYPE_OCCLUSION
     * @type {Integer (Int32)}
     */
    static OCCLUSION => 9

    /**
     * Native name: D3DQUERYTYPE_TIMESTAMP
     * @type {Integer (Int32)}
     */
    static TIMESTAMP => 10

    /**
     * Native name: D3DQUERYTYPE_TIMESTAMPDISJOINT
     * @type {Integer (Int32)}
     */
    static TIMESTAMPDISJOINT => 11

    /**
     * Native name: D3DQUERYTYPE_TIMESTAMPFREQ
     * @type {Integer (Int32)}
     */
    static TIMESTAMPFREQ => 12

    /**
     * Native name: D3DQUERYTYPE_PIPELINETIMINGS
     * @type {Integer (Int32)}
     */
    static PIPELINETIMINGS => 13

    /**
     * Native name: D3DQUERYTYPE_INTERFACETIMINGS
     * @type {Integer (Int32)}
     */
    static INTERFACETIMINGS => 14

    /**
     * Native name: D3DQUERYTYPE_VERTEXTIMINGS
     * @type {Integer (Int32)}
     */
    static VERTEXTIMINGS => 15

    /**
     * Native name: D3DQUERYTYPE_PIXELTIMINGS
     * @type {Integer (Int32)}
     */
    static PIXELTIMINGS => 16

    /**
     * Native name: D3DQUERYTYPE_BANDWIDTHTIMINGS
     * @type {Integer (Int32)}
     */
    static BANDWIDTHTIMINGS => 17

    /**
     * Native name: D3DQUERYTYPE_CACHEUTILIZATION
     * @type {Integer (Int32)}
     */
    static CACHEUTILIZATION => 18

    /**
     * Native name: D3DQUERYTYPE_MEMORYPRESSURE
     * @type {Integer (Int32)}
     */
    static MEMORYPRESSURE => 19
}
