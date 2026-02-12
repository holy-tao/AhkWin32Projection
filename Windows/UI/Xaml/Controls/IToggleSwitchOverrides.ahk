#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IToggleSwitchOverrides extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToggleSwitchOverrides
     * @type {Guid}
     */
    static IID => Guid("{bfd07f53-f8ca-4e47-949e-9e80429b3d16}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnToggled", "OnOnContentChanged", "OnOffContentChanged", "OnHeaderChanged"]

    /**
     * 
     * @returns {HRESULT} 
     */
    OnToggled() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} oldContent 
     * @param {IInspectable} newContent 
     * @returns {HRESULT} 
     */
    OnOnContentChanged(oldContent, newContent) {
        result := ComCall(7, this, "ptr", oldContent, "ptr", newContent, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} oldContent 
     * @param {IInspectable} newContent 
     * @returns {HRESULT} 
     */
    OnOffContentChanged(oldContent, newContent) {
        result := ComCall(8, this, "ptr", oldContent, "ptr", newContent, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} oldContent 
     * @param {IInspectable} newContent 
     * @returns {HRESULT} 
     */
    OnHeaderChanged(oldContent, newContent) {
        result := ComCall(9, this, "ptr", oldContent, "ptr", newContent, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
