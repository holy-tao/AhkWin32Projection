#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Encrypted app package options.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/ne-appxpackaging-appx_encrypted_package_options
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
class APPX_ENCRYPTED_PACKAGE_OPTIONS extends Win32BitflagEnum {

    /**
     * No options.
     * Native name: APPX_ENCRYPTED_PACKAGE_OPTION_NONE
     * @type {Integer (Int32)}
     */
    static OPTION_NONE => 0

    /**
     * Option to use diffusion.
     * Native name: APPX_ENCRYPTED_PACKAGE_OPTION_DIFFUSION
     * @type {Integer (Int32)}
     */
    static OPTION_DIFFUSION => 1

    /**
     * Option to add page hashes.
     * Native name: APPX_ENCRYPTED_PACKAGE_OPTION_PAGE_HASHING
     * @type {Integer (Int32)}
     */
    static OPTION_PAGE_HASHING => 2
}
