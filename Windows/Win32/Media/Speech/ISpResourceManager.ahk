#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IServiceProvider.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpResourceManager extends IServiceProvider{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpResourceManager
     * @type {Guid}
     */
    static IID => Guid("{93384e18-5014-43d5-adbb-a78e055926bd}")

    /**
     * The class identifier for SpResourceManager
     * @type {Guid}
     */
    static CLSID => Guid("{96749373-3391-11d2-9ee3-00c04f797396}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetObject", "GetObject"]

    /**
     * 
     * @param {Pointer<Guid>} guidServiceId 
     * @param {IUnknown} pUnkObject 
     * @returns {HRESULT} 
     */
    SetObject(guidServiceId, pUnkObject) {
        result := ComCall(4, this, "ptr", guidServiceId, "ptr", pUnkObject, "HRESULT")
        return result
    }

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @param {Pointer<Guid>} guidServiceId 
     * @param {Pointer<Guid>} ObjectCLSID 
     * @param {Pointer<Guid>} ObjectIID 
     * @param {BOOL} fReleaseWhenLastExternalRefReleased 
     * @returns {Pointer<Void>} 
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject(guidServiceId, ObjectCLSID, ObjectIID, fReleaseWhenLastExternalRefReleased) {
        result := ComCall(5, this, "ptr", guidServiceId, "ptr", ObjectCLSID, "ptr", ObjectIID, "int", fReleaseWhenLastExternalRefReleased, "ptr*", &ppObject := 0, "HRESULT")
        return ppObject
    }
}
