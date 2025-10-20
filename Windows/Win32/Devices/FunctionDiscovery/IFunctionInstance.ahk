#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IServiceProvider.ahk

/**
 * A function instance is created as the result of calling one of the IFunctionDiscovery methods; client program do not create these objects themselves.
 * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class IFunctionInstance extends IServiceProvider{
    /**
     * The interface identifier for IFunctionInstance
     * @type {Guid}
     */
    static IID => Guid("{33591c10-0bed-4f02-b0ab-1530d5533ee9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @param {Pointer<UInt16>} ppszCoMemIdentity 
     * @returns {HRESULT} 
     */
    GetID(ppszCoMemIdentity) {
        result := ComCall(4, this, "ushort*", ppszCoMemIdentity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} ppszCoMemProviderInstanceIdentity 
     * @returns {HRESULT} 
     */
    GetProviderInstanceID(ppszCoMemProviderInstanceIdentity) {
        result := ComCall(5, this, "ushort*", ppszCoMemProviderInstanceIdentity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStgAccess 
     * @param {Pointer<IPropertyStore>} ppIPropertyStore 
     * @returns {HRESULT} 
     */
    OpenPropertyStore(dwStgAccess, ppIPropertyStore) {
        result := ComCall(6, this, "uint", dwStgAccess, "ptr", ppIPropertyStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} ppszCoMemCategory 
     * @param {Pointer<UInt16>} ppszCoMemSubCategory 
     * @returns {HRESULT} 
     */
    GetCategory(ppszCoMemCategory, ppszCoMemSubCategory) {
        result := ComCall(7, this, "ushort*", ppszCoMemCategory, "ushort*", ppszCoMemSubCategory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
