#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class ITypeFactory extends IUnknown{
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
     * 
     * @param {Pointer<ITypeInfo>} pTypeInfo 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppv 
     * @returns {HRESULT} 
     */
    CreateFromTypeInfo(pTypeInfo, riid, ppv) {
        result := ComCall(3, this, "ptr", pTypeInfo, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
