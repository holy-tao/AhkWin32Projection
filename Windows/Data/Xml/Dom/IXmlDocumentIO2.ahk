#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Xml.Dom
 * @version WindowsRuntime 1.4
 */
class IXmlDocumentIO2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXmlDocumentIO2
     * @type {Guid}
     */
    static IID => Guid("{5d034661-7bd8-4ad5-9ebf-81e6347263b1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadXmlFromBuffer", "LoadXmlFromBufferWithSettings"]

    /**
     * 
     * @param {IBuffer} buffer_ 
     * @returns {HRESULT} 
     */
    LoadXmlFromBuffer(buffer_) {
        result := ComCall(6, this, "ptr", buffer_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IBuffer} buffer_ 
     * @param {XmlLoadSettings} loadSettings 
     * @returns {HRESULT} 
     */
    LoadXmlFromBufferWithSettings(buffer_, loadSettings) {
        result := ComCall(7, this, "ptr", buffer_, "ptr", loadSettings, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
