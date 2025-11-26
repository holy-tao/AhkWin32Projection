#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IRealTimeStylus3 interface enables multitouch for the realtime stylus.
 * @see https://docs.microsoft.com/windows/win32/api//rtscom/nn-rtscom-irealtimestylus3
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IRealTimeStylus3 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRealTimeStylus3
     * @type {Guid}
     */
    static IID => Guid("{d70230a3-6986-4051-b57a-1cf69f4d9db5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MultiTouchEnabled", "put_MultiTouchEnabled"]

    /**
     * @type {BOOL} 
     */
    MultiTouchEnabled {
        get => this.get_MultiTouchEnabled()
        set => this.put_MultiTouchEnabled(value)
    }

    /**
     * Indicates whether the IRealTimeStylus3 object has multitouch input enabled.
     * @remarks
     * 
     * The following table lists the defined opt-in options for multitouch.
     * 
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * <th>Value</th>
     * </tr>
     * <tr>
     * <td>TABLET_ENABLE_MULTITOUCHDATA</td>
     * <td>Indicates opt-in for multitouch data.</td>
     * <td>0x01000000</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-irealtimestylus3-get_multitouchenabled
     */
    get_MultiTouchEnabled() {
        result := ComCall(3, this, "int*", &pfEnable := 0, "HRESULT")
        return pfEnable
    }

    /**
     * Indicates whether the IRealTimeStylus3 object has multitouch input enabled.
     * @remarks
     * 
     * The following table lists the defined opt-in options for multitouch.
     * 
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * <th>Value</th>
     * </tr>
     * <tr>
     * <td>TABLET_ENABLE_MULTITOUCHDATA</td>
     * <td>Indicates opt-in for multitouch data.</td>
     * <td>0x01000000</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-irealtimestylus3-put_multitouchenabled
     */
    put_MultiTouchEnabled(fEnable) {
        result := ComCall(4, this, "int", fEnable, "HRESULT")
        return result
    }
}
