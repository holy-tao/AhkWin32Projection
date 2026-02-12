#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.TransactionServer
 * @version v4.0.30319
 */
class IComponentUtil extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComponentUtil
     * @type {Guid}
     */
    static IID => Guid("{6eb22873-8a19-11d0-81b6-00a0c9231c29}")

    /**
     * The class identifier for ComponentUtil
     * @type {Guid}
     */
    static CLSID => Guid("{6eb22884-8a19-11d0-81b6-00a0c9231c29}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InstallComponent", "ImportComponent", "ImportComponentByName", "GetCLSIDs"]

    /**
     * Installs an exception package.
     * @remarks
     * Exception packages are Windows system files that are released outside of a full package Windows release and that update operating-system files. Exception packages are authored only by operating-system teams that have been granted authorization to update Windows system files.
     * 
     * To install and uninstall files that are not protected by Windows File Protection, use the functions documented in [General Setup Functions](https://msdn.microsoft.com/library/ms794585.aspx). To install device drivers, venders should use functions documented in [Device Installation Functions](https://msdn.microsoft.com/library/ms792954.aspx) and [PnP Configuration Manager Functions](https://msdn.microsoft.com/library/ms790838.aspx).
     * 
     * This function has no associated import library or header file; you must call it by using the [**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya) and [**GetProcAddress**](/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress) functions.
     * @param {BSTR} bstrDLLFile 
     * @param {BSTR} bstrTypelibFile 
     * @param {BSTR} bstrProxyStubDLLFile 
     * @returns {HRESULT} This function returns an **HRESULT** value (S\_OK or a failure code). A failure code can be checked against a value of 0x20000100 to determine whether the failure is because a reboot is required.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DevNotes/installcomponentw
     */
    InstallComponent(bstrDLLFile, bstrTypelibFile, bstrProxyStubDLLFile) {
        if(bstrDLLFile is String) {
            pin := BSTR.Alloc(bstrDLLFile)
            bstrDLLFile := pin.Value
        }
        if(bstrTypelibFile is String) {
            pin := BSTR.Alloc(bstrTypelibFile)
            bstrTypelibFile := pin.Value
        }
        if(bstrProxyStubDLLFile is String) {
            pin := BSTR.Alloc(bstrProxyStubDLLFile)
            bstrProxyStubDLLFile := pin.Value
        }

        result := ComCall(7, this, "ptr", bstrDLLFile, "ptr", bstrTypelibFile, "ptr", bstrProxyStubDLLFile, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} bstrCLSID 
     * @returns {HRESULT} 
     */
    ImportComponent(bstrCLSID) {
        if(bstrCLSID is String) {
            pin := BSTR.Alloc(bstrCLSID)
            bstrCLSID := pin.Value
        }

        result := ComCall(8, this, "ptr", bstrCLSID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} bstrProgID 
     * @returns {HRESULT} 
     */
    ImportComponentByName(bstrProgID) {
        if(bstrProgID is String) {
            pin := BSTR.Alloc(bstrProgID)
            bstrProgID := pin.Value
        }

        result := ComCall(9, this, "ptr", bstrProgID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDLLFile 
     * @param {BSTR} bstrTypelibFile 
     * @param {Pointer<Pointer<SAFEARRAY>>} aCLSIDs 
     * @returns {HRESULT} 
     */
    GetCLSIDs(bstrDLLFile, bstrTypelibFile, aCLSIDs) {
        if(bstrDLLFile is String) {
            pin := BSTR.Alloc(bstrDLLFile)
            bstrDLLFile := pin.Value
        }
        if(bstrTypelibFile is String) {
            pin := BSTR.Alloc(bstrTypelibFile)
            bstrTypelibFile := pin.Value
        }

        aCLSIDsMarshal := aCLSIDs is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, "ptr", bstrDLLFile, "ptr", bstrTypelibFile, aCLSIDsMarshal, aCLSIDs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
