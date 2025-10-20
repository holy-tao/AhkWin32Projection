#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to enable VDS to perform miscellaneous operations on provider objects.
 * @see https://docs.microsoft.com/windows/win32/api//vdshwprv/nn-vdshwprv-ivdsproviderprivate
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsProviderPrivate extends IUnknown{
    /**
     * The interface identifier for IVdsProviderPrivate
     * @type {Guid}
     */
    static IID => Guid("{11f3cd41-b7e8-48ff-9472-9dff018aa292}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @param {Pointer<Guid>} ObjectId 
     * @param {Integer} type 
     * @param {Pointer<IUnknown>} ppObjectUnk 
     * @returns {HRESULT} If the function succeeds, and <i>lpvObject</i> is a valid pointer, the return value is the number of bytes stored into the buffer.
     * 
     * If the function succeeds, and <i>lpvObject</i> is <b>NULL</b>, the return value is the number of bytes required to hold the information the function would store into the buffer.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject(ObjectId, type, ppObjectUnk) {
        result := ComCall(3, this, "ptr", ObjectId, "int", type, "ptr", ppObjectUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszMachineName 
     * @param {Pointer<IUnknown>} pCallbackObject 
     * @returns {HRESULT} 
     */
    OnLoad(pwszMachineName, pCallbackObject) {
        pwszMachineName := pwszMachineName is String ? StrPtr(pwszMachineName) : pwszMachineName

        result := ComCall(4, this, "ptr", pwszMachineName, "ptr", pCallbackObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bForceUnload 
     * @returns {HRESULT} 
     */
    OnUnload(bForceUnload) {
        result := ComCall(5, this, "int", bForceUnload, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
