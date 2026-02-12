#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FontFamily.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IFontFamilyFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFontFamilyFactory
     * @type {Guid}
     */
    static IID => Guid("{d5603377-3dae-4dcd-af09-f9498e9ec659}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstanceWithName"]

    /**
     * 
     * @param {HSTRING} familyName 
     * @param {IInspectable} baseInterface 
     * @param {Pointer<Object>} innerInterface 
     * @returns {FontFamily} 
     */
    CreateInstanceWithName(familyName, baseInterface, innerInterface) {
        if(familyName is String) {
            pin := HSTRING.Create(familyName)
            familyName := pin.Value
        }
        familyName := familyName is Win32Handle ? NumGet(familyName, "ptr") : familyName

        result := ComCall(6, this, "ptr", familyName, "ptr", baseInterface, "ptr", innerInterface, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FontFamily(value)
    }
}
