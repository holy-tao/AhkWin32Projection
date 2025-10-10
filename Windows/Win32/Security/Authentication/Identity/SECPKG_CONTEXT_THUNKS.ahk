#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SECPKG_CONTEXT_THUNKS structure contains information about QueryContextAttributes (General) calls to be executed in LSA mode.This structure is used by the SpGetExtendedInformation and SpSetExtendedInformation functions.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecpkg/ns-ntsecpkg-secpkg_context_thunks
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_CONTEXT_THUNKS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The number of attributes specified by the <i>Levels</i> parameter.
     * @type {Integer}
     */
    InfoLevelCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of one or more context attributes. For a complete list of valid values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querycontextattributesa">QueryContextAttributes (General)</a>.
     * @type {Array<UInt32>}
     */
    Levels{
        get {
            if(!this.HasProp("__LevelsProxyArray"))
                this.__LevelsProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "uint")
            return this.__LevelsProxyArray
        }
    }
}
