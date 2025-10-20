#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Manages access to the running object table (ROT), a globally accessible look-up table on each workstation.
 * @remarks
 * 
  * The ROT contains entries of the following form: (<i>pmkObjectName</i>, <i>pUnkObject</i>).
  * 
  * The <i>pmkObjectName</i> element is a pointer to the moniker that identifies the running object. The <i>pUnkObject</i> element is a pointer to the running object itself. During the binding process, monikers consult the <i>pmkObjectName</i> entries in the ROT to see whether an object is already running.
  * 
  * Objects that can be named by monikers must be registered with the ROT when they are loaded and their registration must be revoked when they are no longer running.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-irunningobjecttable
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IRunningObjectTable extends IUnknown{
    /**
     * The interface identifier for IRunningObjectTable
     * @type {Guid}
     */
    static IID => Guid("{00000010-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} grfFlags 
     * @param {Pointer<IUnknown>} punkObject 
     * @param {Pointer<IMoniker>} pmkObjectName 
     * @param {Pointer<UInt32>} pdwRegister 
     * @returns {HRESULT} 
     */
    Register(grfFlags, punkObject, pmkObjectName, pdwRegister) {
        result := ComCall(3, this, "uint", grfFlags, "ptr", punkObject, "ptr", pmkObjectName, "uint*", pdwRegister, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRegister 
     * @returns {HRESULT} 
     */
    Revoke(dwRegister) {
        result := ComCall(4, this, "uint", dwRegister, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMoniker>} pmkObjectName 
     * @returns {HRESULT} 
     */
    IsRunning(pmkObjectName) {
        result := ComCall(5, this, "ptr", pmkObjectName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @param {Pointer<IMoniker>} pmkObjectName 
     * @param {Pointer<IUnknown>} ppunkObject 
     * @returns {HRESULT} If the function succeeds, and <i>lpvObject</i> is a valid pointer, the return value is the number of bytes stored into the buffer.
     * 
     * If the function succeeds, and <i>lpvObject</i> is <b>NULL</b>, the return value is the number of bytes required to hold the information the function would store into the buffer.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject(pmkObjectName, ppunkObject) {
        result := ComCall(6, this, "ptr", pmkObjectName, "ptr", ppunkObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRegister 
     * @param {Pointer<FILETIME>} pfiletime 
     * @returns {HRESULT} 
     */
    NoteChangeTime(dwRegister, pfiletime) {
        result := ComCall(7, this, "uint", dwRegister, "ptr", pfiletime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMoniker>} pmkObjectName 
     * @param {Pointer<FILETIME>} pfiletime 
     * @returns {HRESULT} 
     */
    GetTimeOfLastChange(pmkObjectName, pfiletime) {
        result := ComCall(8, this, "ptr", pmkObjectName, "ptr", pfiletime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumMoniker>} ppenumMoniker 
     * @returns {HRESULT} 
     */
    EnumRunning(ppenumMoniker) {
        result := ComCall(9, this, "ptr", ppenumMoniker, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
