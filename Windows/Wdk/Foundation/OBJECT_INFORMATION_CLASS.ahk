#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Foundation
 */
class OBJECT_INFORMATION_CLASS extends Win32Enum {

    /**
     * Native name: ObjectBasicInformation
     * @type {Integer (Int32)}
     */
    static BasicInformation => 0

    /**
     * Native name: ObjectTypeInformation
     * @type {Integer (Int32)}
     */
    static TypeInformation => 2
}
