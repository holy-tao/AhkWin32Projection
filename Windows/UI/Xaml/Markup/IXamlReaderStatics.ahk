#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Markup
 * @version WindowsRuntime 1.4
 */
class IXamlReaderStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlReaderStatics
     * @type {Guid}
     */
    static IID => Guid("{9891c6bd-534f-4955-b85a-8a8dc0dca602}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Load", "LoadWithInitialTemplateValidation"]

    /**
     * Reads texel data without any filtering or sampling.
     * @param {HSTRING} xaml 
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/direct3dhlsl/dx-graphics-hlsl-to-load
     */
    Load(xaml) {
        if(xaml is String) {
            pin := HSTRING.Create(xaml)
            xaml := pin.Value
        }
        xaml := xaml is Win32Handle ? NumGet(xaml, "ptr") : xaml

        result := ComCall(6, this, "ptr", xaml, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @param {HSTRING} xaml 
     * @returns {IInspectable} 
     */
    LoadWithInitialTemplateValidation(xaml) {
        if(xaml is String) {
            pin := HSTRING.Create(xaml)
            xaml := pin.Value
        }
        xaml := xaml is Win32Handle ? NumGet(xaml, "ptr") : xaml

        result := ComCall(7, this, "ptr", xaml, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }
}
