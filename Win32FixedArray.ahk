#Requires AutoHotkey v2.0
#Include CStyleArray.ahk

/**
 * Win32FixedArray is a helper class used with Win32Struct proxy objects to allow for more
 * friendly handling of fixed-length arrays which are members of structs.
 *
 * Unlike `CStyleArrayList`, fixed arrays wrap external memory and cannot be resized.
 * They do not own their backing memory.
 *
 * For resizeable arrays which are *not* struct members, use `CStyleArrayList`, which implements
 * ArrayList behavior and is resizeable, but can only be created in script-managed memory.
 */
class Win32FixedArray extends CStyleArrayList {

    /**
     * Initializes a new fixed array at a given memory address
     * @param {Integer} ptr The address of the first element in the array
     * @param {Integer} length The number of elements in the array
     * @param {Class} elementType The type of the elements contained in the array. If the elements
     *          are primitives, this must be `Primitive`, and dllCallType must be set
     * @param {String} dllCallType If `elementType` is `Primitive`, this is the type of the elements in the
     *          array.
     */
    __New(ptr, length, elementType, dllCallType := ""){
        if(!IsInteger(ptr))
            throw TypeError("Expected an Integer, but got a(n) " . Type(ptr))

        if(!IsInteger(length) || length < 0)
            throw TypeError("Length must be a non-negative Integer, but got a(n) " . Type(length))

        if(!(elementType is Class))
            throw TypeError("Expected a Class, but got a(n) " . Type(elementType))

        if(elementType == Primitive && !CStyleArrayList.DllCallTypeWidths.Has(dllCallType))
            throw UnsetError("Empty or unknown DllCallType", , dllCallType)

        ; Do NOT call super.__New() - CStyleArrayList's constructor allocates a Buffer,
        ; which we don't want. Instead, wrap external memory with a plain buffer-like object.
        this.elementType := elementType
        this.dllCallType := dllCallType
        this.__buf := {ptr: ptr, size: length * this._GetElementWidth()}
        this.__length := length
    }

    /**
     * @readonly The number of elements in the array. Fixed arrays cannot be resized.
     * @type {Integer}
     */
    length {
        get => this.__length
        set{
            if(this.HasProp("__length"))
                throw PropertyError("This property is read-only", , "length")
            this.__length := value
        }
    }

    ; Fixed arrays cannot be resized - block all mutation methods
    Push(values*)   => this._ThrowImmutable()
    Pop()           => this._ThrowImmutable()
    InsertAt(args*) => this._ThrowImmutable()
    RemoveAt(index) => this._ThrowImmutable()
    _Resize()       => this._ThrowImmutable()

    /**
     * @private Throws an error indicating that fixed arrays cannot be resized
     */
    _ThrowImmutable(){
        throw MethodError("Fixed arrays cannot be resized")
    }
}
