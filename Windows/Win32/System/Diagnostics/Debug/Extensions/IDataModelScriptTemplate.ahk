#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\Com\IStream.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDataModelScriptTemplate extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataModelScriptTemplate
     * @type {Guid}
     */
    static IID => Guid("{1303dec4-fa3b-4f1b-9224-b953d16babb5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetDescription", "GetContent"]

    /**
     * 
     * @returns {BSTR} 
     */
    GetName() {
        templateName := BSTR()
        result := ComCall(3, this, "ptr", templateName, "HRESULT")
        return templateName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetDescription() {
        templateDescription := BSTR()
        result := ComCall(4, this, "ptr", templateDescription, "HRESULT")
        return templateDescription
    }

    /**
     * 
     * @returns {IStream} 
     */
    GetContent() {
        result := ComCall(5, this, "ptr*", &contentStream := 0, "HRESULT")
        return IStream(contentStream)
    }
}
