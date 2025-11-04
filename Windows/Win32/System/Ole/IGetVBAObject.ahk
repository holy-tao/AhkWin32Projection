#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Gets access to the IVBFormat interface.
 * @see https://docs.microsoft.com/windows/win32/api//vbinterf/nn-vbinterf-igetvbaobject
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IGetVBAObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGetVBAObject
     * @type {Guid}
     */
    static IID => Guid("{91733a60-3f4c-101b-a3f6-00aa0034e4e9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetObject"]

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvObj 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} If the function succeeds, and <i>lpvObject</i> is a valid pointer, the return value is the number of bytes stored into the buffer.
     * 
     * If the function succeeds, and <i>lpvObject</i> is <b>NULL</b>, the return value is the number of bytes required to hold the information the function would store into the buffer.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject(riid, ppvObj, dwReserved) {
        ppvObjMarshal := ppvObj is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", riid, ppvObjMarshal, ppvObj, "uint", dwReserved, "HRESULT")
        return result
    }
}
