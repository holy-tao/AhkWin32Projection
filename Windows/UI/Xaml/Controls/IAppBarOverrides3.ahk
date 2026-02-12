#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IAppBarOverrides3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBarOverrides3
     * @type {Guid}
     */
    static IID => Guid("{412bbbc8-51d0-4b49-ab62-a3dd6bdcb298}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnClosing", "OnOpening"]

    /**
     * 
     * @param {IInspectable} e 
     * @returns {HRESULT} 
     */
    OnClosing(e) {
        result := ComCall(6, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} e 
     * @returns {HRESULT} 
     */
    OnOpening(e) {
        result := ComCall(7, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
