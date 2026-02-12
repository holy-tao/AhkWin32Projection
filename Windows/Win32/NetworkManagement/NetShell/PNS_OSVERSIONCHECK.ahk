#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetShell
 * @version v4.0.30319
 */
class PNS_OSVERSIONCHECK extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Integer} CIMOSType 
     * @param {Integer} CIMOSProductSuite 
     * @param {PWSTR} CIMOSVersion 
     * @param {PWSTR} CIMOSBuildNumber 
     * @param {PWSTR} CIMServicePackMajorVersion 
     * @param {PWSTR} CIMServicePackMinorVersion 
     * @param {Integer} uiReserved 
     * @param {Integer} dwReserved 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(CIMOSType, CIMOSProductSuite, CIMOSVersion, CIMOSBuildNumber, CIMServicePackMajorVersion, CIMServicePackMinorVersion, uiReserved, dwReserved) {
        CIMOSVersion := CIMOSVersion is String ? StrPtr(CIMOSVersion) : CIMOSVersion
        CIMOSBuildNumber := CIMOSBuildNumber is String ? StrPtr(CIMOSBuildNumber) : CIMOSBuildNumber
        CIMServicePackMajorVersion := CIMServicePackMajorVersion is String ? StrPtr(CIMServicePackMajorVersion) : CIMServicePackMajorVersion
        CIMServicePackMinorVersion := CIMServicePackMinorVersion is String ? StrPtr(CIMServicePackMinorVersion) : CIMServicePackMinorVersion

        result := ComCall(3, this, "uint", CIMOSType, "uint", CIMOSProductSuite, "ptr", CIMOSVersion, "ptr", CIMOSBuildNumber, "ptr", CIMServicePackMajorVersion, "ptr", CIMServicePackMinorVersion, "uint", uiReserved, "uint", dwReserved, "int")
        return result
    }
}
