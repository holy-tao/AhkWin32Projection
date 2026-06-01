#Requires AutoHotkey v2.1-alpha.30+ 64-bit

#Include ./Yunit/Yunit.ahk
#Include ./YunitExtensions/Assert.ahk

#Import "../Win32ComInterface.ahk" { Win32ComInterface }
#Import "../Guid.ahk" { Guid }
#Import "../Windows/Win32/System/Com/IUnknown.ahk" { IUnknown }

class Win32ComInterfaceTests {

    /**
     * Implementing an interface exercises the vtable wiring, default IUnknown
     * implementations, parameter marshalling through ComCall, and refCount.
     *
     * Callback signatures: the COM ABI prepends a `cppThis` pointer as the first
     * argument. A fat-arrow impl takes that explicitly; an object method takes
     * `this` (the impl object) implicitly plus `cppThis` as its first declared
     * parameter. CallbackCreate's third arg is the C++-side count: declared + 1.
     */
    class InterfaceImplementations {

        Implement_WithObject_CreatesInterfaceImplementation() {
            argActual := 0, noArgsCalled := false

            test := DummyInterface({
                TestNoArgs: (cppThis) => noArgsCalled := true,
                TestArg: (cppThis, arg) => argActual := arg
            })

            try {
                test.TestNoArgs()
                test.TestArg(42)

                Assert.Equals(noArgsCalled, true)
                Assert.Equals(argActual, 42)
            }
            finally {
                test.Dispose()
            }
        }

        DefaultQueryInterface_WithTopLevelGuid_GetsInterface() {
            test := DummyInterface({
                TestNoArgs: (cppThis) => 0,
                TestArg: (cppThis, arg) => 0
            })

            result := test.QueryInterface(DummyInterface.IID, &outPtr := 0)

            Assert.Equals(result, 0)            ; S_OK
            Assert.Equals(test.refCount, 2)     ; QI AddRef'd
            Assert.Equals(outPtr, test.ptr)

            test.Release()
            test.Dispose()
        }

        DefaultQueryInterface_WithIUnknownGuid_GetsInterface() {
            test := DummyInterface({
                TestNoArgs: (cppThis) => 0,
                TestArg: (cppThis, arg) => 0
            })

            result := test.QueryInterface(IUnknown.IID, &outPtr := 0)

            Assert.Equals(result, 0)
            Assert.Equals(test.refCount, 2)
            Assert.Equals(outPtr, test.ptr)

            test.Release()
            test.Dispose()
        }

        DefaultQueryInterface_WithUnimplementedGuid_ReturnsENOINTERFACE() {
            static E_NOINTERFACE := 0x80004002

            test := DummyInterface({
                TestNoArgs: (cppThis) => 0,
                TestArg: (cppThis, arg) => 0
            })

            try {
                result := test.QueryInterface(Guid.Create(), &outPtr := 0)
                result := result & 0x00000000FFFFFFFF

                Assert.Equals(result, E_NOINTERFACE)
                Assert.Equals(test.refCount, 1)
                Assert.Equals(outPtr, 0)
            }
            finally {
                test.Dispose()
            }
        }

        Implement_WithMissingFunction_ThrowsUnsetError() {
            Assert.Throws((*) => DummyInterface({TestNoArgs: (cppThis) => 1}), UnsetError)
        }

        Implement_WithObjectWithAddRefOverride_UsesOverride() {
            addRefCalled := false

            test := DummyInterface({
                AddRef: (cppThis) => (addRefCalled := true, 2),
                TestNoArgs: (cppThis) => FileAppend(Error("Printing callstack").Stack, "*"),
                TestArg: (cppThis, arg) => FileAppend(Error("Printing callstack").Stack, "*")
            })

            test.TestNoArgs()
            refCount := test.AddRef()

            Assert.Equals(addRefCalled, true)
            Assert.Equals(refCount, 2)

            test.Release()
            test.Dispose()
        }

        Implement_WithObjectWithQIOverride_UsesOverride() {
            queryInterfaceOverrideCalled := false

            test := DummyInterface({
                QueryInterface: (cppThis, riid, ptr) => (queryInterfaceOverrideCalled := true),
                TestNoArgs: (cppThis) => FileAppend(Error("Printing callstack").Stack, "*"),
                TestArg: (cppThis, arg) => FileAppend(Error("Printing callstack").Stack, "*")
            })

            result := test.QueryInterface(DummyInterface.IID, &outPtr := 0)

            Assert.Equals(queryInterfaceOverrideCalled, true)

            test.Release()
            test.Dispose()
        }
    }
}

;@ahkunit-ignore
struct DummyInterface extends IUnknown {

    static IID {
        get {
            if (!this.HasOwnProp("__IID"))
                this.__IID := Guid.Create()
            return this.__IID
        }
    }

    static __New() {
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    struct Vtbl extends IUnknown.Vtbl {
        TestNoArgs : IntPtr
        TestArg    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(this, 0, "ptr") == 0) {
            this.vtbl := DummyInterface.Vtbl()
        }
        super.__New(implObj, flags)
    }

    TestNoArgs() {
        return ComCall(3, this, "int")
    }

    TestArg(arg) {
        return ComCall(4, this, "int", arg, "int")
    }

    Query(iid) {
        if (DummyInterface.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.TestNoArgs := CallbackCreate(GetMethod(implObj, "TestNoArgs"), flags, 1)
        this.vtbl.TestArg := CallbackCreate(GetMethod(implObj, "TestArg"), flags, 2)
    }

    Dispose() {
        if (!this.owned)
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        super.Dispose()
        CallbackFree(this.vtbl.TestNoArgs)
        CallbackFree(this.vtbl.TestArg)
    }
}
