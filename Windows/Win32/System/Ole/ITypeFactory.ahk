#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class ITypeFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITypeFactory
     * @type {Guid}
     */
    static IID => Guid("{0000002e-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromTypeInfo"]

    /**
     * 
     * @param {ITypeInfo} pTypeInfo 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    CreateFromTypeInfo(pTypeInfo, riid) {
        result := ComCall(3, this, "ptr", pTypeInfo, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return IUnknown(ppv)
    }
}
