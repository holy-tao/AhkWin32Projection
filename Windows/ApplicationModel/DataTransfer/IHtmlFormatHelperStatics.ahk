#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class IHtmlFormatHelperStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHtmlFormatHelperStatics
     * @type {Guid}
     */
    static IID => Guid("{e22e7749-dd70-446f-aefc-61cee59f655e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStaticFragment", "CreateHtmlFormat"]

    /**
     * 
     * @param {HSTRING} htmlFormat 
     * @returns {HSTRING} 
     */
    GetStaticFragment(htmlFormat) {
        if(htmlFormat is String) {
            pin := HSTRING.Create(htmlFormat)
            htmlFormat := pin.Value
        }
        htmlFormat := htmlFormat is Win32Handle ? NumGet(htmlFormat, "ptr") : htmlFormat

        htmlFragment := HSTRING()
        result := ComCall(6, this, "ptr", htmlFormat, "ptr", htmlFragment, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return htmlFragment
    }

    /**
     * 
     * @param {HSTRING} htmlFragment 
     * @returns {HSTRING} 
     */
    CreateHtmlFormat(htmlFragment) {
        if(htmlFragment is String) {
            pin := HSTRING.Create(htmlFragment)
            htmlFragment := pin.Value
        }
        htmlFragment := htmlFragment is Win32Handle ? NumGet(htmlFragment, "ptr") : htmlFragment

        htmlFormat := HSTRING()
        result := ComCall(7, this, "ptr", htmlFragment, "ptr", htmlFormat, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return htmlFormat
    }
}
