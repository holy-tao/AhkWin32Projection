#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IControlOverrides6 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IControlOverrides6
     * @type {Guid}
     */
    static IID => Guid("{e194c96a-d8cc-4339-a0e1-2e9c420879ec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnPreviewKeyDown", "OnPreviewKeyUp", "OnCharacterReceived"]

    /**
     * 
     * @param {KeyRoutedEventArgs} e 
     * @returns {HRESULT} 
     */
    OnPreviewKeyDown(e) {
        result := ComCall(6, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {KeyRoutedEventArgs} e 
     * @returns {HRESULT} 
     */
    OnPreviewKeyUp(e) {
        result := ComCall(7, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {CharacterReceivedRoutedEventArgs} e 
     * @returns {HRESULT} 
     */
    OnCharacterReceived(e) {
        result := ComCall(8, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
