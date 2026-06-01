#Requires AutoHotkey v2.1-alpha.30+ 64-bit

#Import ".\Yunit\Yunit.ahk" { Yunit }
#Import ".\YunitExtensions\Assert.ahk" { Assert }

#Import "../Windows/Win32/System/LibraryLoader/Apis.ahk" { LoadLibraryW }
#Import "../Windows/Win32/Foundation/HMODULE.ahk" { HMODULE }
#Import "../Windows/Win32/Foundation/HANDLE.ahk" { HANDLE }
#Import "../Windows/Win32/Storage/FileSystem/Apis.ahk" { FindFirstFileW }
#Import "../Windows/Win32/Storage/FileSystem/WIN32_FIND_DATAW.ahk" { WIN32_FIND_DATAW }

/**
 * Tests for v2.1 handle ownership: functions that transfer ownership of a handle to the
 * script (return values / [Out] params not marked [DoNotRelease]) box it as the handle's
 * `.Owned` subclass, whose __Delete frees it automatically. Borrowed handles
 * (e.g. GetModuleHandle, marked [DoNotRelease]) stay the plain handle type.
 */
class HandleOwnershipTests {

    ; Raw probe that never frees and never throws: 0 when the module isn't loaded.
    static Probe(name) => DllCall("GetModuleHandleW", "ptr", StrPtr(name), "ptr")

    /**
     * LoadLibrary transfers ownership, so its return is boxed as HMODULE.Owned.
     */
    LoadLibrary_Returns_OwnedHandle() {
        h := LoadLibraryW("winmm.dll")
        try {
            Assert.IsType(h, HMODULE.Owned)
            Yunit.Assert(h.Value != 0, "Expected a non-null module handle")
        } finally {
            h := unset   ; drop the owned handle -> FreeLibrary
        }
    }

    /**
     * Adopt() moves ownership, the old handle should be invalidated
     */
    Adopt_Moves_Ownership() {
        ; Acquire a handle the generated layer does NOT own (raw LoadLibrary), then hand
        ; its single ownership to an Owned wrapper via Adopt.
        raw := DllCall("LoadLibraryW", "ptr", StrPtr("winmm.dll"), "ptr")
        Yunit.Assert(raw != 0, "raw LoadLibraryW failed")

        borrowed := HMODULE(raw)
        owned := borrowed.Adopt()

        Assert.IsType(owned, HMODULE.Owned)
        Assert.Equals(owned.Value, raw)
        Assert.Equals(borrowed.Value, 0)   ; source invalidated by the move

        ; owned drops at end of scope, expect access violation here if things go haywire
    }

    /**
     * Adopting an already-owned handle is a programming error and throws.
     */
    Adopt_OnOwned_Throws() {
        owned := LoadLibraryW("winmm.dll")
        try {
            Assert.Throws(() => owned.Adopt(), TypeError)
        } finally {
            owned := unset
        }
    }

    /**
     * An owned handle frees itself when it leaves scope. Only assert this when winmm
     * isn't already loaded by the host process (otherwise its refcount won't reach 0).
     */
    OwnedHandle_FreesItself_OnScopeExit() {
        name := "winmm.dll"
        if (HandleOwnershipTests.Probe(name) != 0)
            return   ; already loaded elsewhere; can't observe the unload deterministically

        loadAndDrop(libName) {
            local h := LoadLibraryW(libName)   ; HMODULE.Owned; dropped when this returns
        }
        loadAndDrop(name)

        Assert.Equals(HandleOwnershipTests.Probe(name), 0)   ; auto-freed -> unloaded
    }

    /**
     * A HANDLE with a context-specific RAIIFree (FindFirstFile must be closed with FindClose,
     * not the type-default CloseHandle) is boxed as a HANDLE.OwnedWith(FindClose) subclass:
     * still `is HANDLE.Owned`, and frees itself via FindClose on scope exit.
     */
    ContextRAIIFree_BoxesAs_OwnedWith() {
        data := WIN32_FIND_DATAW()
        h := FindFirstFileW(A_WinDir "\*", data)
        try {
            Assert.IsType(h, HANDLE.Owned)               ; the OwnedWith subclass extends Owned
            Yunit.Assert(h.Value != -1 && h.Value != 0, "expected a valid find handle")
        } finally {
            ; Expect FindClose to fire and not leak / fail catastrophically
            h := unset
        }
    }
}
