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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetStartRecConfig", "GetStartRecConfig", "SetNamespace", "GetNamespace"]

    /**
     * 
     * @param {BOOL} fStartStopsCur 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferconfigure3-setstartrecconfig
     */
    SetStartRecConfig(fStartStopsCur) {
        result := ComCall(13, this, "int", fStartStopsCur, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferconfigure3-getstartrecconfig
     */
    GetStartRecConfig() {
        result := ComCall(14, this, "int*", &pfStartStopsCur := 0, "HRESULT")
        return pfStartStopsCur
    }

    /**
     * 
     * @param {PWSTR} pszNamespace 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferconfigure3-setnamespace
     */
    SetNamespace(pszNamespace) {
        pszNamespace := pszNamespace is String ? StrPtr(pszNamespace) : pszNamespace

        result := ComCall(15, this, "ptr", pszNamespace, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferconfigure3-getnamespace
     */
    GetNamespace() {
        result := ComCall(16, this, "ptr*", &ppszNamespace := 0, "HRESULT")
        return ppszNamespace
    }
}
