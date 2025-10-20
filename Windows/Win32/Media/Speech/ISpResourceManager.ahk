#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IServiceProvider.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpResourceManager extends IServiceProvider{
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
     * 
     * @param {Pointer<Guid>} guidServiceId 
     * @param {Pointer<IUnknown>} pUnkObject 
     * @returns {HRESULT} 
     */
    SetObject(guidServiceId, pUnkObject) {
        result := ComCall(4, this, "ptr", guidServiceId, "ptr", pUnkObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @param {Pointer<Guid>} guidServiceId 
     * @param {Pointer<Guid>} ObjectCLSID 
     * @param {Pointer<Guid>} ObjectIID 
     * @param {BOOL} fReleaseWhenLastExternalRefReleased 
     * @param {Pointer<Void>} ppObject 
     * @returns {HRESULT} If the function succeeds, and <i>lpvObject</i> is a valid pointer, the return value is the number of bytes stored into the buffer.
     * 
     * If the function succeeds, and <i>lpvObject</i> is <b>NULL</b>, the return value is the number of bytes required to hold the information the function would store into the buffer.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject(guidServiceId, ObjectCLSID, ObjectIID, fReleaseWhenLastExternalRefReleased, ppObject) {
        result := ComCall(5, this, "ptr", guidServiceId, "ptr", ObjectCLSID, "ptr", ObjectIID, "int", fReleaseWhenLastExternalRefReleased, "ptr", ppObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
