#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Foundation
 * @version v4.0.30319
 */
class OBJECT_INFORMATION_CLASS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ObjectBasicInformation => 0

    /**
     * @type {Integer (Int32)}
     */
    static ObjectTypeInformation => 2
}
