#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates whether a location is within the image of an object.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/ne-ocidl-hitresult
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class HITRESULT extends Win32Enum{

    /**
     * The specified location is outside the object and not close to the object.
     * @type {Integer (Int32)}
     */
    static HITRESULT_OUTSIDE => 0

    /**
     * The specified location is within the bounds of the object, but not close to the image. For example, a point in the middle of a transparent circle could be HITRESULT_TRANSPARENT.
     * @type {Integer (Int32)}
     */
    static HITRESULT_TRANSPARENT => 1

    /**
     * The specified location is inside the object or is outside the object but is close enough to the object to be considered inside. Small, thin or detailed objects may use this value. Even if a point is outside the bounding rectangle of an object it may still be close. This value is needed for hitting small objects.
     * @type {Integer (Int32)}
     */
    static HITRESULT_CLOSE => 2

    /**
     * The specified location is within the image of the object.
     * @type {Integer (Int32)}
     */
    static HITRESULT_HIT => 3
}
