#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ne-appmodel-addpackagedependencyoptions
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class AddPackageDependencyOptions extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static AddPackageDependencyOptions_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static AddPackageDependencyOptions_PrependIfRankCollision => 1
}
