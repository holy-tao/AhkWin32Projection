#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IXamlLightOverrides extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlLightOverrides
     * @type {Guid}
     */
    static IID => Guid("{7c6296c7-0173-48e1-b73d-7fa216a9ac28}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetId", "OnConnected", "OnDisconnected"]

    /**
     * Returns the identifier string available in the volume's metadata.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/SecProv/getidentificationfield-win32-encryptablevolume
     */
    GetId() {
        result_ := HSTRING()
        result := ComCall(6, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {UIElement} newElement 
     * @returns {HRESULT} 
     */
    OnConnected(newElement) {
        result := ComCall(7, this, "ptr", newElement, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {UIElement} oldElement 
     * @returns {HRESULT} 
     */
    OnDisconnected(oldElement) {
        result := ComCall(8, this, "ptr", oldElement, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
