#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The IMMCVersionInfo interface provides version information about the installed MMC application.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-immcversioninfo
 * @namespace Windows.Win32.System.Mmc
 */
export default struct IMMCVersionInfo extends IUnknown {
    /**
     * The interface identifier for IMMCVersionInfo
     * @type {Guid}
     */
    static IID := Guid("{a8d2c5fe-cdcb-4b9d-bde5-a27343ff54bc}")

    /**
     * The class identifier for MMCVersionInfo
     * @type {Guid}
     */
    static CLSID := Guid("{d6fedb1d-cf21-4bd9-af3b-c5468e9c6684}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMMCVersionInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetMMCVersion : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMMCVersionInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetMMCVersion method retrieves version information for the MMC application.
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-immcversioninfo">IMMCVersionInfo</a> interface is introduced in MMC 2.0. For instructions on how to determine the MMC version if MMC 1.x is installed, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/detecting-the-mmc-version-number">Detecting the MMC Version Number</a>.
     * @param {Pointer<Integer>} pVersionMajor The version major number. For example, if *<i>pVersionMajor</i> returns 2, then MMC version 2.x is running.
     * @param {Pointer<Integer>} pVersionMinor The version minor number. For example, if *<i>pVersionMinor</i> returns 0, then MMC version x.0 is running.
     * @returns {HRESULT} If successful, the return value is S_OK. Other return values indicate an error code.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-immcversioninfo-getmmcversion
     */
    GetMMCVersion(pVersionMajor, pVersionMinor) {
        pVersionMajorMarshal := pVersionMajor is VarRef ? "int*" : "ptr"
        pVersionMinorMarshal := pVersionMinor is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pVersionMajorMarshal, pVersionMajor, pVersionMinorMarshal, pVersionMinor, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMMCVersionInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMMCVersion := CallbackCreate(GetMethod(implObj, "GetMMCVersion"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMMCVersion)
    }
}
