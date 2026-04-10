#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
class AddPackageDependencyOptions2 extends Win32BitflagEnum {

    /**
     * @type {Integer (Int32)}
     */
    static AddPackageDependencyOptions2_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static AddPackageDependencyOptions2_PrependIfRankCollision => 1

    /**
     * @type {Integer (Int32)}
     */
    static AddPackageDependencyOptions2_SpecifiedPackageFamilyOnly => 2
}
