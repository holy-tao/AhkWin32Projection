#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides access to the type information for an object's coclass entry in its type library.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-iprovideclassinfo
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IProvideClassInfo extends IUnknown{
    /**
     * The interface identifier for IProvideClassInfo
     * @type {Guid}
     */
    static IID => Guid("{b196b283-bab4-101a-b69c-00aa00341d07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ITypeInfo>} ppTI 
     * @returns {HRESULT} 
     */
    GetClassInfo(ppTI) {
        result := ComCall(3, this, "ptr", ppTI, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
