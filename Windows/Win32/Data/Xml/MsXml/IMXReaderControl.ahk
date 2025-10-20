#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IMXReaderControl extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMXReaderControl
     * @type {Guid}
     */
    static IID => Guid("{808f4e35-8d5a-4fbe-8466-33a41279ed30}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["abort", "resume", "suspend"]

    /**
     * 
     * @returns {HRESULT} 
     */
    abort() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    resume() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    suspend() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
