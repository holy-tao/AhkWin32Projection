#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IStreamBufferConfigure2.ahk

/**
 * The IStreamBufferConfigure3 interface is exposed by the StreamBufferConfig object.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferConfigure3)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-istreambufferconfigure3
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IStreamBufferConfigure3 extends IStreamBufferConfigure2{
    /**
     * The interface identifier for IStreamBufferConfigure3
     * @type {Guid}
     */
    static IID => Guid("{7e2d2a1e-7192-4bd7-80c1-061fd1d10402}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * 
     * @param {BOOL} fStartStopsCur 
     * @returns {HRESULT} 
     */
    SetStartRecConfig(fStartStopsCur) {
        result := ComCall(13, this, "int", fStartStopsCur, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfStartStopsCur 
     * @returns {HRESULT} 
     */
    GetStartRecConfig(pfStartStopsCur) {
        result := ComCall(14, this, "ptr", pfStartStopsCur, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszNamespace 
     * @returns {HRESULT} 
     */
    SetNamespace(pszNamespace) {
        pszNamespace := pszNamespace is String ? StrPtr(pszNamespace) : pszNamespace

        result := ComCall(15, this, "ptr", pszNamespace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszNamespace 
     * @returns {HRESULT} 
     */
    GetNamespace(ppszNamespace) {
        result := ComCall(16, this, "ptr", ppszNamespace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
