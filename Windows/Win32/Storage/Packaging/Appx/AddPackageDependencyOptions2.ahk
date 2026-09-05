#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
class AddPackageDependencyOptions2 extends Win32BitflagEnum {

    /**
     * Native name: AddPackageDependencyOptions2_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: AddPackageDependencyOptions2_PrependIfRankCollision
     * @type {Integer (Int32)}
     */
    static PrependIfRankCollision => 1

    /**
     * Native name: AddPackageDependencyOptions2_SpecifiedPackageFamilyOnly
     * @type {Integer (Int32)}
     */
    static SpecifiedPackageFamilyOnly => 2
}
