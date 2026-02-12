#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DdGetDriverInfo function queries the driver for additional DirectDraw and Direct3D functionality that the driver supports.
 * @remarks
 * Drivers must implement <i>DdGetDriverInfo</i> to expose driver-supported DirectDraw functionality that is not returnable through <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvenabledirectdraw">DrvEnableDirectDraw</a>.
 * 
 * The driver's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvgetdirectdrawinfo">DrvGetDirectDrawInfo</a> function returns a pointer to <i>DdGetDriverInfo</i> in the <b>GetDriverInfo</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_halinfo">DD_HALINFO</a> structure.
 * 
 * To inform DirectDraw that the <b>GetDriverInfo</b> member has been set correctly, the driver must also set the DDHALINFO_GETDRIVERINFOSET bit of the <b>dwFlags</b> member in the DD_HALINFO structure. 
 * 
 * <i>DdGetDriverInfo</i> should determine whether the driver and its hardware support the callbacks or capabilities requested by the specified GUID. For all GUIDs except GUID_D3DParseUnknownCommandCallback, if the driver does provide the requested support, it should set the following members of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getdriverinfodata">DD_GETDRIVERINFODATA</a> structure:
 * 
 * <ul>
 * <li>
 * Set <b>dwActualSize</b> to the size in bytes of the callback or capability structure being returned by the driver.
 * 
 * </li>
 * <li>In the memory that <b>lpvData</b> points to, initialize the members of the callback or capability structure that corresponds with the requested feature as follows:<ul>
 * <li>Set the <b>dwSize</b> member to the size in bytes of the structure.</li>
 * <li>For callbacks, set the function pointers to point to those callbacks implemented by the driver, and set the bits in the <b>dwFlags</b> member to indicate what functions the driver supports.</li>
 * <li>For capabilities, set the appropriate members of the capability structure with values supported by the driver/device.</li>
 * </ul>
 * </li>
 * <li>
 * Return DD_OK in <b>ddRVal</b>.
 * 
 * </li>
 * </ul>
 * If the driver does not support the feature, it should set <b>ddRVal</b> to DDERR_CURRENTLYNOTAVAIL and return.
 * 
 * DirectDraw informs the driver of the expected amount of data in the <b>dwExpectedSize</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_getdriverinfodata">DD_GETDRIVERINFODATA</a> structure. The driver must not fill in more data than <b>dwExpectedSize</b> bytes.
 * 
 * To avoid problems using <i>DdGetDriverInfo</i>: 
 * 
 * <ul>
 * <li>
 * Do not implement dependencies based on the order in which <i>DdGetDriverInfo</i> is called. For example, avoid hooking driver initialization steps into <i>DdGetDriverInfo</i>. 
 * 
 * </li>
 * <li>
 * Do not try to ascertain the DirectDraw version based on the calls to <i>DdGetDriverInfo</i>. 
 * 
 * </li>
 * <li>
 * Do not assume anything about the number of times DirectDraw will call the driver, or the number of times DirectDraw will query a given GUID. It is possible that DirectDraw will probe the driver repeatedly with the same GUID. Implementing assumptions about this in the driver hampers its compatibility with future runtimes. 
 * 
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api//content/ddrawint/nc-ddrawint-pdd_getdriverinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDD_GETDRIVERINFO extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<DD_GETDRIVERINFODATA>} param0 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0) {
        result := ComCall(3, this, "ptr", param0, "uint")
        return result
    }
}
