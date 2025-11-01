#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/servprov/nn-servprov-iserviceprovider
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IServiceProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IServiceProvider
     * @type {Guid}
     */
    static IID => Guid("{6d5140c1-7436-11ce-8034-00aa006009fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryService"]

    /**
     * 
     * @param {Pointer<Guid>} guidService 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/servprov/nf-servprov-iserviceprovider-queryservice(refguid_refiid_void)
     */
    QueryService(guidService, riid, ppvObject) {
        result := ComCall(3, this, "ptr", guidService, "ptr", riid, "ptr*", ppvObject, "HRESULT")
        return result
    }
}
