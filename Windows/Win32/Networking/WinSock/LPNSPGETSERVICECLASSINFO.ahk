#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Retrieves all the pertinent class information (schema) pertaining to the namespace provider.
 * @remarks
 * The W2_32.dll uses this function to implement the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsagetserviceclassnamebyclassida">WSAGetServiceClassNameByClassId</a> function, as well as to retrieve the namespace-specific information passed to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicebegin">NSPLookupServiceBegin</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspsetservice">NSPSetService</a> functions.
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpnspgetserviceclassinfo
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPNSPGETSERVICECLASSINFO extends IUnknown {

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
     * @param {Pointer<Guid>} lpProviderId 
     * @param {Pointer<Integer>} lpdwBufSize 
     * @param {Pointer<WSASERVICECLASSINFOW>} lpServiceClassInfo 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(lpProviderId, lpdwBufSize, lpServiceClassInfo) {
        lpdwBufSizeMarshal := lpdwBufSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", lpProviderId, lpdwBufSizeMarshal, lpdwBufSize, "ptr", lpServiceClassInfo, "int")
        return result
    }
}
