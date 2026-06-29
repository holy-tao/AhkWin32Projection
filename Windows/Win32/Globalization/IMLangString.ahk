#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Foundation\BOOL.ahk" { BOOL }
#Import "..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct IMLangString extends IUnknown {
    /**
     * The interface identifier for IMLangString
     * @type {Guid}
     */
    static IID := Guid("{c04d65ce-b70d-11d0-b188-00aa0038c969}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMLangString interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Sync      : IntPtr
        GetLength : IntPtr
        SetMLStr  : IntPtr
        GetMLStr  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMLangString.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Sync01 through Sync16 attributes are string representations of 32-bit values that Windows Media Player uses when it synchronizes playlists with one of up to 16 portable devices.
     * @remarks
     * These are read/write attributes. A value of zero indicates that Windows Media Player should not synchronize the playlist with the associated device. A value greater than zero indicates a synchronization priority for the given playlist.
     * 
     * Based on user input, Windows Media Player sets this attribute for each of the playlists in the library. When Windows Media Player attempts to synchronize a playlist with a portable device, it examines each playlist to compare the values for the **Sync***XX* attributes that represent the device partnership. Playlists that have lower **Sync***XX* values receive higher synchronization priority.
     * 
     * For example, the library might contain the following four playlists and respective **Sync***XX* values:
     * 
     * 
     * 
     * | Playlist Name | Sync01 Value |
     * |---------------|--------------|
     * | GymMusic.WPL  | 0x0000000D   |
     * | Relax.WPL     | 0x00000020   |
     * | DriveHome.WPL | 0x00000001   |
     * | NoGo.WPL      | 0x00000000   |
     * 
     * 
     * 
     *  
     * 
     * When Windows Media Player synchronizes the device associated with the attribute, it will synchronize the playlists in the following order:
     * 
     * 1.  DriveHome.WPL
     * 2.  GymMusic.WPL
     * 3.  Relax.WPL
     * 
     * To determine whether you can change the value of this attribute, use the [Media.isReadOnlyItem](media-isreadonlyitem.md) method.
     * @param {BOOL} fNoAccess 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WMP/sync-attributes
     */
    Sync(fNoAccess) {
        result := ComCall(3, this, BOOL, fNoAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLength() {
        result := ComCall(4, this, "int*", &plLen := 0, "HRESULT")
        return plLen
    }

    /**
     * 
     * @param {Integer} lDestPos 
     * @param {Integer} lDestLen 
     * @param {IUnknown} pSrcMLStr 
     * @param {Integer} lSrcPos 
     * @param {Integer} lSrcLen 
     * @returns {HRESULT} 
     */
    SetMLStr(lDestPos, lDestLen, pSrcMLStr, lSrcPos, lSrcLen) {
        result := ComCall(5, this, "int", lDestPos, "int", lDestLen, "ptr", pSrcMLStr, "int", lSrcPos, "int", lSrcLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lSrcPos 
     * @param {Integer} lSrcLen 
     * @param {IUnknown} pUnkOuter 
     * @param {Integer} dwClsContext 
     * @param {Pointer<Guid>} piid 
     * @param {Pointer<IUnknown>} ppDestMLStr 
     * @param {Pointer<Integer>} plDestPos 
     * @param {Pointer<Integer>} plDestLen 
     * @returns {HRESULT} 
     */
    GetMLStr(lSrcPos, lSrcLen, pUnkOuter, dwClsContext, piid, ppDestMLStr, plDestPos, plDestLen) {
        plDestPosMarshal := plDestPos is VarRef ? "int*" : "ptr"
        plDestLenMarshal := plDestLen is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "int", lSrcPos, "int", lSrcLen, "ptr", pUnkOuter, "uint", dwClsContext, Guid.Ptr, piid, IUnknown.Ptr, ppDestMLStr, plDestPosMarshal, plDestPos, plDestLenMarshal, plDestLen, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMLangString.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Sync := CallbackCreate(GetMethod(implObj, "Sync"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.SetMLStr := CallbackCreate(GetMethod(implObj, "SetMLStr"), flags, 6)
        this.vtbl.GetMLStr := CallbackCreate(GetMethod(implObj, "GetMLStr"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Sync)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.SetMLStr)
        CallbackFree(this.vtbl.GetMLStr)
    }
}
