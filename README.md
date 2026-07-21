# EcommerceAPP
I build This iOS App as a real teaching sample with SOLID + concurrency + architecture + memory + testing

I Built it around dummyjson.com/products as the mock API. What's in there:

Domain → Data → Presentation layers, with the dependency arrow pointing inward correctly.
Full working code: 
Product entity, 
ProductRepositoryProtocol, 
GetProductsUseCase, 
DTO mapping, 
an async/await network service, 
ViewModels with @MainActor, 
and the SwiftUI Views
A Coordinator using NavigationStack + NavigationPath 
List view never knows detail view exists, it just fires a closure

FUTURE EXTENSIOS:

I will add pagination (infinite scroll) or a CachedProductRepository decorator to show Open/Closed in action live.
