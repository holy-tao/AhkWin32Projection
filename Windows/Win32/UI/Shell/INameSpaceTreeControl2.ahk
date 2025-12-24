#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INameSpaceTreeControl.ahk

/**
 * Extends the INameSpaceTreeControl interface by providing methods that get and set the display styles of treeview controls for use with Shell namespace items.
 * @remarks
 * 
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-inamespacetreecontrol">INameSpaceTreeControl</a> interface, from which it inherits.
 * 
 * Use class identifier (CLSID) CLSID_NameSpaceTreeControl to instantiate an instance of this interface.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * An implementation of this interface is provided with Windows. Third parties should not implement their own versions.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-inamespacetreecontrol2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class INameSpaceTreeControl2 extends INameSpaceTreeControl{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INameSpaceTreeControl2
     * @type {Guid}
     */
    static IID => Guid("{7cc7aed8-290e-49bc-8945-c1401cc9306c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 22

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetControlStyle", "GetControlStyle", "SetControlStyle2", "GetControlStyle2"]

    /**
     * Sets the display styles for the namespace object's treeview controls.
     * @param {Integer} nstcsMask Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcstyle">NSTCSTYLE</a></b>
     * 
     * One or more of the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcstyle">NSTCSTYLE</a> constants that specify the styles for which the method should set new values.
     * @param {Integer} nstcsStyle Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcstyle">NSTCSTYLE</a></b>
     * 
     * A bitmap that contains the new values for the styles specified in <i>nstcsMask</i>. If the bit that represents the individual <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcstyle">NSTCSTYLE</a> value is 0, that style is not used. If the value is 1, the style is applied to the treeview. Styles in positions not specified in <i>nstcsMask</i> are left at their current setting regardless of their bit's value in this bitmap.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-inamespacetreecontrol2-setcontrolstyle
     */
    SetControlStyle(nstcsMask, nstcsStyle) {
        result := ComCall(22, this, "uint", nstcsMask, "uint", nstcsStyle, "HRESULT")
        return result
    }

    /**
     * Gets the display styles set for the namespace object's treeview controls.
     * @param {Integer} nstcsMask Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcstyle">NSTCSTYLE</a></b>
     * 
     * One or more of the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcstyle">NSTCSTYLE</a> constants that specify the values for which the method should retrieve the current settings.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcstyle">NSTCSTYLE</a>*</b>
     * 
     * Pointer to a value that, when this method returns successfully, receives the values requested in <i>nstcsMask</i>. If the bit that represents the individual <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcstyle">NSTCSTYLE</a> value is 0, that value is not set. If the value is 1, it is the current setting. Bit values in positions not specifically requested in <i>nstcsMask</i> do not necessarily reflect the current settings and should not be used.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-inamespacetreecontrol2-getcontrolstyle
     */
    GetControlStyle(nstcsMask) {
        result := ComCall(23, this, "uint", nstcsMask, "uint*", &pnstcsStyle := 0, "HRESULT")
        return pnstcsStyle
    }

    /**
     * Sets the extended display styles for the namespace object's treeview controls.
     * @param {Integer} nstcsMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-nstcstyle2">NSTCSTYLE2</a></b>
     * 
     * One or more of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-nstcstyle2">NSTCSTYLE2</a> constants that specify the styles for which the method should set new values.
     * @param {Integer} nstcsStyle Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-nstcstyle2">NSTCSTYLE2</a></b>
     * 
     * A bitmap that contains the new values for the styles specified in <i>nstcsMask</i>. If the bit that represents the individual <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-nstcstyle2">NSTCSTYLE2</a> value is 0, that style is not used. If the value is 1, the style is applied to the treeview. Styles in positions not specified in <i>nstcsMask</i> are left at their current setting regardless of their bit's value in this bitmap.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-inamespacetreecontrol2-setcontrolstyle2
     */
    SetControlStyle2(nstcsMask, nstcsStyle) {
        result := ComCall(24, this, "int", nstcsMask, "int", nstcsStyle, "HRESULT")
        return result
    }

    /**
     * Gets the extended display styles set for the namespace object's treeview controls.
     * @param {Integer} nstcsMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-nstcstyle2">NSTCSTYLE2</a></b>
     * 
     * One or more of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-nstcstyle2">NSTCSTYLE2</a> constants that specify the values for which the method should retrieve the current settings.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-nstcstyle2">NSTCSTYLE2</a>*</b>
     * 
     * Pointer to a value that, when this method returns successfully, receives the values requested in <i>nstcsMask</i>. If the bit that represents the individual <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-nstcstyle2">NSTCSTYLE2</a> value is 0, that value is not set. If the value is 1, it is the current setting. Bit values in positions not specifically requested in <i>nstcsMask</i> do not necessarily reflect the current settings and should not be used.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-inamespacetreecontrol2-getcontrolstyle2
     */
    GetControlStyle2(nstcsMask) {
        result := ComCall(25, this, "int", nstcsMask, "int*", &pnstcsStyle := 0, "HRESULT")
        return pnstcsStyle
    }
}
