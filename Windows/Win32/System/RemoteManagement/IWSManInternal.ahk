#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class IWSManInternal extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSManInternal
     * @type {Guid}
     */
    static IID => Guid("{04ae2b1d-9954-4d99-94a9-a961e72c3a13}")

    /**
     * The class identifier for WSManInternal
     * @type {Guid}
     */
    static CLSID => Guid("{7de087a5-5dcb-4df7-bb12-0924ad8fbd9a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConfigSDDL"]

    /**
     * 
     * @param {IDispatch} session 
     * @param {VARIANT} resourceUri 
     * @param {Integer} flags 
     * @param {Pointer<BSTR>} resource 
     * @returns {HRESULT} 
     */
    ConfigSDDL(session, resourceUri, flags, resource) {
        result := ComCall(7, this, "ptr", session, "ptr", resourceUri, "int", flags, "ptr", resource, "HRESULT")
        return result
    }
}
