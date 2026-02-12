#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\Collections\IVectorView.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class ILanguageExtensionSubtags extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILanguageExtensionSubtags
     * @type {Guid}
     */
    static IID => Guid("{7d7daf45-368d-4364-852b-dec927037b85}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetExtensionSubtags"]

    /**
     * 
     * @param {HSTRING} singleton 
     * @returns {IVectorView<HSTRING>} 
     */
    GetExtensionSubtags(singleton) {
        if(singleton is String) {
            pin := HSTRING.Create(singleton)
            singleton := pin.Value
        }
        singleton := singleton is Win32Handle ? NumGet(singleton, "ptr") : singleton

        result := ComCall(6, this, "ptr", singleton, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }
}
