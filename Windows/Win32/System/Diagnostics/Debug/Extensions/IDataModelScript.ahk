#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\Com\IStream.ahk
#Include ..\..\..\..\Foundation\PWSTR.ahk
#Include ..\..\..\Com\IUnknown.ahk
#Include ..\..\..\..\Foundation\HRESULT.ahk
#Include .\IDataModelScriptClient.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class IDataModelScript extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataModelScript
     * @type {Guid}
     */
    static IID => Guid("{7b4d30fc-b14a-49f8-8d87-d9a1480c97f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "Rename", "Populate", "Execute", "Unlink", "IsInvocable", "InvokeMain"]

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetName
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/iwmcodecstrings-getname
     */
    GetName() {
        scriptName := BSTR({Value: 0}, True)
        result := ComCall(3, this, "ptr", scriptName, "HRESULT")
        return scriptName
    }

    /**
     * 
     * @param {PWSTR} scriptName 
     * @returns {HRESULT} 
     */
    Rename(scriptName) {
        scriptName := scriptName is String ? StrPtr(scriptName) : scriptName

        result := ComCall(4, this, "ptr", scriptName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} contentStream 
     * @returns {HRESULT} 
     */
    Populate(contentStream) {
        result := ComCall(5, this, "ptr", contentStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataModelScriptClient} client 
     * @returns {HRESULT} 
     */
    Execute(client) {
        result := ComCall(6, this, "ptr", client, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Unlink() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsInvocable() {
        result := ComCall(8, this, "int*", &isInvocable := 0, "HRESULT")
        return isInvocable
    }

    /**
     * 
     * @param {IDataModelScriptClient} client 
     * @returns {HRESULT} 
     */
    InvokeMain(client) {
        result := ComCall(9, this, "ptr", client, "HRESULT")
        return result
    }
}
