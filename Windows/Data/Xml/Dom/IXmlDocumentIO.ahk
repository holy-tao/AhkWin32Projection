#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Xml.Dom
 * @version WindowsRuntime 1.4
 */
class IXmlDocumentIO extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXmlDocumentIO
     * @type {Guid}
     */
    static IID => Guid("{6cd0e74e-ee65-4489-9ebf-ca43e87ba637}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadXml", "LoadXmlWithSettings", "SaveToFileAsync"]

    /**
     * 
     * @param {HSTRING} xml 
     * @returns {HRESULT} 
     */
    LoadXml(xml) {
        if(xml is String) {
            pin := HSTRING.Create(xml)
            xml := pin.Value
        }
        xml := xml is Win32Handle ? NumGet(xml, "ptr") : xml

        result := ComCall(6, this, "ptr", xml, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} xml 
     * @param {XmlLoadSettings} loadSettings 
     * @returns {HRESULT} 
     */
    LoadXmlWithSettings(xml, loadSettings) {
        if(xml is String) {
            pin := HSTRING.Create(xml)
            xml := pin.Value
        }
        xml := xml is Win32Handle ? NumGet(xml, "ptr") : xml

        result := ComCall(7, this, "ptr", xml, "ptr", loadSettings, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @returns {IAsyncAction} 
     */
    SaveToFileAsync(file_) {
        result := ComCall(8, this, "ptr", file_, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }
}
