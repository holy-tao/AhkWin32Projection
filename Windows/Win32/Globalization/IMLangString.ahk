#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class IMLangString extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMLangString
     * @type {Guid}
     */
    static IID => Guid("{c04d65ce-b70d-11d0-b188-00aa0038c969}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Sync", "GetLength", "SetMLStr", "GetMLStr"]

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
        result := ComCall(3, this, "int", fNoAccess, "HRESULT")
        return result
    }

    /**
     * Returns the length, in bytes, of a valid security identifier (SID).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-getlengthsid
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

        result := ComCall(6, this, "int", lSrcPos, "int", lSrcLen, "ptr", pUnkOuter, "uint", dwClsContext, "ptr", piid, "ptr*", ppDestMLStr, plDestPosMarshal, plDestPos, plDestLenMarshal, plDestLen, "HRESULT")
        return result
    }
}
